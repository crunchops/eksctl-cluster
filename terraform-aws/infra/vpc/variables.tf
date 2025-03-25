variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_names" {
  description = "List of VPC names"
  type        = list(string)
}

variable "cidr_blocks" {
  description = "CIDR blocks for VPCs"
  type        = map(string)
}

variable "subnet_config" {
  description = "Subnet configuration for each VPC"
  type = map(object({
    public_subnets  = number
    private_subnets = number
    public_cidr     = list(string)
    private_cidr    = list(string)
  }))
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}