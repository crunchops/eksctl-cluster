resource "aws_route_table" "public_route" {
  for_each = toset(var.vpc_names)

  vpc_id = aws_vpc.vpc[each.key].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[each.key].id
  }

  dynamic "route" {
    for_each = each.key == "management" ? aws_vpc_peering_connection.management_peering : {}
    content {
      cidr_block                = var.cidr_blocks[route.key]
      vpc_peering_connection_id = route.value.id
    }
  }

  dynamic "route" {
    for_each = each.key != "management" ? { "management" = aws_vpc_peering_connection.management_peering[each.key] } : {}
    content {
      cidr_block                = var.cidr_blocks["management"]
      vpc_peering_connection_id = route.value.id
    }
  }

  tags = {
    Name        = "${each.key}-eks-onebot-public-route"
    Environment = each.key
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}

resource "aws_route_table" "private_route" {
  for_each = toset(var.vpc_names)

  vpc_id = aws_vpc.vpc[each.key].id

  dynamic "route" {
    for_each = each.key != "management" ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat[each.key].id
    }
  }

  dynamic "route" {
    for_each = each.key == "management" ? aws_vpc_peering_connection.management_peering : {}
    content {
      cidr_block                = var.cidr_blocks[route.key]
      vpc_peering_connection_id = route.value.id
    }
  }

  dynamic "route" {
    for_each = each.key != "management" ? { "management" = aws_vpc_peering_connection.management_peering[each.key] } : {}
    content {
      cidr_block                = var.cidr_blocks["management"]
      vpc_peering_connection_id = route.value.id
    }
  }

  tags = {
    Name        = "${each.key}-eks-onebot-private-route"
    Environment = each.key
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}

resource "aws_route_table_association" "public_association" {
  for_each = { for k, v in aws_subnet.public_subnet : k => v if contains(var.vpc_names, split("-", k)[0]) }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route[split("-", each.key)[0]].id
}

resource "aws_route_table_association" "private_association" {
  for_each = { for k, v in aws_subnet.private_subnet : k => v if contains(var.vpc_names, split("-", k)[0]) }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route[split("-", each.key)[0]].id
}