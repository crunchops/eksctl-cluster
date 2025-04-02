provider "aws" {
  region = var.region
}

# Create VPC endpoints for the specified services
resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "ec2-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "ecr-api-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "ecr-dkr-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Interface"

  tags = {
    Name = "s3-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.sts"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "sts-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "ssm-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "sqs" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.sqs"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "sqs-vpc-endpoint"
  }
}

resource "aws_vpc_endpoint" "eks" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.eks"
  vpc_endpoint_type = "Interface"

  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  tags = {
    Name = "eks-vpc-endpoint"
  }
}
