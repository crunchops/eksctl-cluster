terraform {
  backend "s3" {
    bucket = "techies-terraform"
    key = "terraform-state/vpn-server/vpn-server.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}