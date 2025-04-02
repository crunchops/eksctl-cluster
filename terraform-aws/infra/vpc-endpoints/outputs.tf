output "all_ec2_endpoint_ids" {
  description = "Map of EC2 VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.ec2_endpoint_ids
}

output "all_ecr_api_endpoint_ids" {
  description = "Map of ECR API VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.ecr_api_endpoint_ids
}

output "all_ecr_dkr_endpoint_ids" {
  description = "Map of ECR DKR VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.ecr_dkr_endpoint_ids
}

output "all_s3_endpoint_ids" {
  description = "Map of S3 VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.s3_endpoint_ids
}

output "all_sts_endpoint_ids" {
  description = "Map of STS VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.sts_endpoint_ids
}

output "all_ssm_endpoint_ids" {
  description = "Map of SSM VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.ssm_endpoint_ids
}

output "all_sqs_endpoint_ids" {
  description = "Map of SQS VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.sqs_endpoint_ids
}

output "all_eks_endpoint_ids" {
  description = "Map of EKS VPC endpoint IDs from the child module"
  value       = module.vpc_endpoints.eks_endpoint_ids
}

output "deployed_environments" {
  description = "List of environments where VPC endpoints were deployed"
  value       = module.vpc_endpoints.active_environments
}