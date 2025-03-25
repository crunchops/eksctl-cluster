terraform {
  backend "s3" {
    bucket = "setnext-infra"
    key = "terraform-state/ovpn-server/ovpn.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}