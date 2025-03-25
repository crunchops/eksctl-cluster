resource "aws_vpc" "vpc" {
  for_each = toset(var.vpc_names)

  cidr_block           = var.cidr_blocks[each.key]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${each.key}-eks-onebot-vpc"
    Environment = each.key
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}