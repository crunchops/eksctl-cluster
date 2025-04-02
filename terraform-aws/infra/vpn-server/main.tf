terraform {
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

# Calling ovpn Server Module
module "openvpn" {
  source           = "../../modules/ec2"
  region           = var.region
  vpc_id           = var.vpc_id
  public_subnet    = var.public_subnet
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  allowed_ssh_cidr = var.allowed_ssh_cidr
  ssh_key_name     = var.ssh_key_name
  tags             = var.tags
}
