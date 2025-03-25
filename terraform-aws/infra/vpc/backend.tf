terraform {
  backend "s3" {
    bucket = "setnext-infra"
    key = "terraform-state/vpc/vpc.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}