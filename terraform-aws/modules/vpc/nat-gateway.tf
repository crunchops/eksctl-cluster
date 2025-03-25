resource "aws_eip" "nat_eip" {
  for_each = toset([for name in var.vpc_names : name if name != "management"])

  domain = "vpc"
  tags = {
    Name        = "${each.key}-eks-onebot-nat-eip"
    Environment = each.key
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}

resource "aws_nat_gateway" "nat" {
  for_each = toset([for name in var.vpc_names : name if name != "management"])

  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = aws_subnet.public_subnet["${each.key}-public-0"].id  
  tags = {
    Name        = "${each.key}-eks-onebot-nat"
    Environment = each.key
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}