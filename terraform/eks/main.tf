# ---------- EKS Cluster IAM Role ----------
resource "aws_iam_role" "cluster" {
  name = "${var.environment}-${var.cluster_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_policy" {
  role       = aws_iam_role.cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# ---------- EKS Cluster ----------
resource "aws_eks_cluster" "this" {
  name     = "${var.environment}-${var.cluster_name}"
  role_arn = aws_iam_role.cluster.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids              = concat(var.private_subnet_ids, var.public_subnet_ids)
    endpoint_public_access  = true
    endpoint_private_access = true
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_policy]

  tags = {
    Name = "${var.environment}-${var.cluster_name}"
  }
}

# ---------- Fargate Pod Execution IAM Role ----------
resource "aws_iam_role" "fargate" {
  name = "${var.environment}-${var.cluster_name}-fargate-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "eks-fargate-pods.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "fargate_policy" {
  role       = aws_iam_role.fargate.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

# ---------- Fargate Profiles (one per namespace, private subnets only) ----------
resource "aws_eks_fargate_profile" "this" {
  for_each = toset(var.fargate_namespaces)

  cluster_name            = aws_eks_cluster.this.name
  fargate_profile_name    = "${var.environment}-${var.cluster_name}-${each.value}"
  pod_execution_role_arn  = aws_iam_role.fargate.arn
  subnet_ids              = var.private_subnet_ids

  selector {
    namespace = each.value
  }

  depends_on = [aws_iam_role_policy_attachment.fargate_policy]

  tags = {
    Name = "${var.environment}-${var.cluster_name}-${each.value}-fargate"
  }
}