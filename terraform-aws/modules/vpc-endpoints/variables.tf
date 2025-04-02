variable "region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the VPC endpoints."
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the VPC endpoints."
  type        = list(string)
}


