module "vpc_endpoints" {
  source = "../../modules/vpc-endpoints"

  region       = var.region
	environments = var.environments
}