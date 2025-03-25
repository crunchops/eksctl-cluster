# Output VPC IDs
output "vpc_ids" {
  description = "IDs of the created VPCs"
  value       = { for k, v in aws_vpc.vpc : k => v.id }
}

# Output Public Subnet IDs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = { for k, v in aws_subnet.public_subnet : k => v.id }
}

# Output Private Subnet IDs
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = { for k, v in aws_subnet.private_subnet : k => v.id }
}

# Output Public Route Table IDs
output "public_route_table_ids" {
  description = "IDs of the public route tables"
  value       = { for k, v in aws_route_table.public_route : k => v.id }
}

# Output Private Route Table IDs
output "private_route_table_ids" {
  description = "IDs of the private route tables"
  value       = { for k, v in aws_route_table.private_route : k => v.id }
}

# Output Public Route Table Associations
output "public_route_table_associations" {
  description = "Public route table associations"
  value       = { for k, v in aws_route_table_association.public_association : k => v.route_table_id }
}

# Output Private Route Table Associations
output "private_route_table_associations" {
  description = "Private route table associations"
  value       = { for k, v in aws_route_table_association.private_association : k => v.route_table_id }
}

# Output VPC Peering Connection IDs
output "vpc_peering_connection_ids" {
  description = "IDs of the VPC peering connections"
  value       = { for k, v in aws_vpc_peering_connection.management_peering : k => v.id }
}

# Output Internet Gateway IDs
output "internet_gateway_ids" {
  description = "IDs of the Internet Gateways"
  value       = { for k, v in aws_internet_gateway.igw : k => v.id }
}

# Output NAT Gateway IDs
output "nat_gateway_ids" {
  description = "IDs of the NAT Gateways"
  value       = { for k, v in aws_nat_gateway.nat : k => v.id }
}

# Output Availability Zones
output "availability_zones" {
  description = "List of availability zones used"
  value       = var.azs
}

# Output CIDR Blocks for VPCs
output "vpc_cidr_blocks" {
  description = "CIDR blocks for the VPCs"
  value       = var.cidr_blocks
}

# Output Subnet Configuration
output "subnet_configuration" {
  description = "Subnet configuration for each VPC"
  value       = var.subnet_config
}