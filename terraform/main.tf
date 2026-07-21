# ---------- VPC Module ----------
module "vpc" {
  source = "./vpc"

  name = var.cluster_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  single_nat_gateway = var.single_nat_gateway
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

# ---------- EKS Module (uses VPC module outputs) ----------
module "eks" {
  source = "./eks"

  cluster_name        = var.cluster_name
  environment         = var.environment
  eks_version         = var.eks_version
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnets
  public_subnet_ids   = module.vpc.public_subnets
  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size

  depends_on = [module.vpc]
}