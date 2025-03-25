resource "aws_internet_gateway" "igw" {
  for_each = toset(var.vpc_names)

  vpc_id = aws_vpc.vpc[each.key].id
  tags = {
    Name        = "${each.key}-eks-onebot-igw"
    Environment = each.key
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}