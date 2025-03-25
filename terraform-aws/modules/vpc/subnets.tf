resource "aws_subnet" "public_subnet" {
  for_each = merge([
    for vpc_name, config in var.subnet_config : {
      for i in range(config.public_subnets) : "${vpc_name}-public-${i}" => {
        vpc_name = vpc_name
        cidr     = config.public_cidr[i]
        az_index = i % length(var.azs)
      }
    }
  ]...)

  vpc_id                  = aws_vpc.vpc[each.value.vpc_name].id
  cidr_block              = each.value.cidr
  availability_zone       = var.azs[each.value.az_index]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${each.value.vpc_name}-eks-onebot-public-${each.value.az_index}"
    Environment = each.value.vpc_name
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = merge([
    for vpc_name, config in var.subnet_config : {
      for i in range(config.private_subnets) : "${vpc_name}-private-${i}" => {
        vpc_name = vpc_name
        cidr     = config.private_cidr[i]
        az_index = i % length(var.azs)
      }
    }
  ]...)

  vpc_id                  = aws_vpc.vpc[each.value.vpc_name].id
  cidr_block              = each.value.cidr
  availability_zone       = var.azs[each.value.az_index]
  map_public_ip_on_launch = false
  tags = {
    Name        = "${each.value.vpc_name}-eks-onebot-private-${each.value.az_index}"
    Environment = each.value.vpc_name
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}