provider "aws" {
  region = var.region
}

# Local variable to filter only environments marked for deployment
locals {
  active_environments = { for env, config in var.environments : env => config if config.deploy }
}

# VPC Endpoints for each active environment
resource "aws_vpc_endpoint" "ec2" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "ec2-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "ecr_api" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "ecr-api-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "ecr-dkr-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "s3" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  # private_dns_enabled = true

  tags = {
    Name        = "s3-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "sts" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.sts"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "sts-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "ssm" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "ssm-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "sqs" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.sqs"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "sqs-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}

resource "aws_vpc_endpoint" "eks" {
  for_each          = local.active_environments
  vpc_id            = each.value.vpc_id
  service_name      = "com.amazonaws.${var.region}.eks"
  vpc_endpoint_type = "Interface"

  security_group_ids  = each.value.security_group_ids
  subnet_ids          = each.value.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "eks-vpc-endpoint-${each.key}"
    Environment = each.key
  }
}