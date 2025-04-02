variable "region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "environments" {
  description = "Map of environments with their VPC ID, security group IDs, and subnet IDs."
  type = map(object({
    vpc_id             = string
    security_group_ids = list(string)
    subnet_ids         = list(string)
    deploy             = bool
  }))
}