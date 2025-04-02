output "ec2_endpoint_ids" {
  description = "Map of EC2 VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.ec2 : env => ep.id }
}

output "ecr_api_endpoint_ids" {
  description = "Map of ECR API VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.ecr_api : env => ep.id }
}

output "ecr_dkr_endpoint_ids" {
  description = "Map of ECR DKR VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.ecr_dkr : env => ep.id }
}

output "s3_endpoint_ids" {
  description = "Map of S3 VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.s3 : env => ep.id }
}

output "sts_endpoint_ids" {
  description = "Map of STS VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.sts : env => ep.id }
}

output "ssm_endpoint_ids" {
  description = "Map of SSM VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.ssm : env => ep.id }
}

output "sqs_endpoint_ids" {
  description = "Map of SQS VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.sqs : env => ep.id }
}

output "eks_endpoint_ids" {
  description = "Map of EKS VPC endpoint IDs for each active environment"
  value       = { for env, ep in aws_vpc_endpoint.eks : env => ep.id }
}

output "active_environments" {
  description = "List of active environment names"
  value       = keys(local.active_environments)
}