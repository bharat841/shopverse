variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "cluster_name" {
  description = "EKS cluster name, used for subnet auto-discovery tags"
  default     = "shopverse-eks"
}

variable "environment" {
  default = "uat"
}

variable "single_nat_gateway" {
  description = "true = 1 NAT for all AZs (cheap, dev), false = 1 NAT per AZ (HA, prod)"
  type        = bool
  default     = true
}