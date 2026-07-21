output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_arn" {
  value = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_ca" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}

output "fargate_profile_arns" {
  value = { for ns, profile in aws_eks_fargate_profile.this : ns => profile.arn }
}

output "fargate_execution_role_arn" {
  value = aws_iam_role.fargate.arn
}