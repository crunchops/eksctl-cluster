variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ovpn Server will be deployed"
  type        = string
}

variable "public_subnet" {
  description = "Public Subnet ID where the ovpn Server will be deployed"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the ovpn Server"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type for the ovpn Server"
  type        = string
}

variable "ssh_key_name" {
  description = "The SSH key pair to use for the ovpn Server"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "List of allowed CIDR blocks for SSH access"
  type        = list(string)
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}
