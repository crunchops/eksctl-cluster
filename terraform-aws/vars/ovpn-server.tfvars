region = "us-east-1"
vpc_id = "vpc-01ca37721221124cc"
public_subnet = "subnet-0b13a586c53b3a180"
ami_id        = "ami-0d2048bec34647872"
instance_type = "t2.medium"

ssh_key_name = "infinity-dev-us-east-v1"


allowed_ssh_cidr = ["0.0.0.0/0"]

tags = {
  environment = "dev"
  project     = "eks-cluster"
  owner       = "DevOps"
  createdby   = "Terraform"
}

