variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "single_nat_gateway" {
  type = bool
}

variable "enable_vpn_gateway" {
  type = bool
}

variable "tags" {
  type = map(string)
}

# ---------- EKS specific ----------
variable "eks_version" {
  type = string
}

variable "fargate_namespaces" {
  type = list(string)
}