terraform {
  backend "s3" {
    bucket       = "techies-terraform"
    key          = "terraform-state/vpc-endpoints/vpc-endpoints.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}