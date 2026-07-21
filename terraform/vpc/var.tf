variable "name" {
  type        = string
  description = "Base name used for tagging VPC resources (e.g. cluster/project name)"
}

variable "cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type = list(string)
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "enable_vpn_gateway" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}