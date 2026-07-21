output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "natgw_ids" {
  value = aws_nat_gateway.nat[*].id
}

output "vpn_gateway_id" {
  value = var.enable_vpn_gateway ? aws_vpn_gateway.this[0].id : null
}

output "azs" {
  value = var.azs
}