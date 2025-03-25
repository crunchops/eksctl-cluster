module "parent_vpc" {
  source = "../../modules/vpc"

  # Pass variables to the parent VPC module
  region       = var.region
  vpc_names    = var.vpc_names
  cidr_blocks  = var.cidr_blocks
  subnet_config = var.subnet_config
  azs          = var.azs
}