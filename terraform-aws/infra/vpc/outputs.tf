output "vpc_ids" {
  description = "IDs of the created VPCs"
  value       = module.parent_vpc.vpc_ids
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.parent_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.parent_vpc.private_subnet_ids
}

output "public_route_table_ids" {
  description = "IDs of the public route tables"
  value       = module.parent_vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "IDs of the private route tables"
  value       = module.parent_vpc.private_route_table_ids
}

output "vpc_peering_connection_ids" {
  description = "IDs of the VPC peering connections"
  value       = module.parent_vpc.vpc_peering_connection_ids
}