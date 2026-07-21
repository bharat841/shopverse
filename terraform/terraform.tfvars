region   = "us-east-1"
vpc_cidr = "10.0.0.0/20"

azs = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

cluster_name       = "shopverse-eks"
environment        = "uat"
single_nat_gateway = true
enable_vpn_gateway = true

tags = {
  Terraform   = "true"
  Environment = "uat"
}

# ---------- EKS ----------
eks_version = "1.30"

fargate_namespaces = ["default", "kube-system"]