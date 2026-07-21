variable "cluster_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "fargate_namespaces" {
  type        = list(string)
  description = "Kubernetes namespaces that should run on Fargate (each gets its own profile)"
  default     = ["default", "kube-system"]
}