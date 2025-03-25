resource "aws_vpc_peering_connection" "management_peering" {
  for_each = toset(["dev", "stage", "prod"])

  vpc_id      = aws_vpc.vpc["management"].id
  peer_vpc_id = aws_vpc.vpc[each.key].id
  auto_accept = true
  tags = {
    Name        = "management-to-${each.key}-eks-onebot-peering"
    Environment = "multi-env"
    Project     = "onebot"
    ManagedBy   = "terraform"
  }
}