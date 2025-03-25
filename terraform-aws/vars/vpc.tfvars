region = "us-east-1"

vpc_names = ["dev", "stage", "prod", "management"]

cidr_blocks = {
  dev         = "10.0.0.0/18"
  stage       = "10.1.0.0/18"
  prod        = "10.2.0.0/18"
  management  = "10.3.0.0/16"
}

subnet_config = {
  dev = {
    public_subnets  = 3
    private_subnets = 3
    public_cidr     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
    private_cidr    = ["10.0.16.0/20", "10.0.32.0/20", "10.0.48.0/20"]
  }
  stage = {
    public_subnets  = 3
    private_subnets = 3
    public_cidr     = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
    private_cidr    = ["10.1.16.0/20", "10.1.32.0/20", "10.1.48.0/20"]
  }
  prod = {
    public_subnets  = 3
    private_subnets = 3
    public_cidr     = ["10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24"]
    private_cidr    = ["10.2.16.0/20", "10.2.32.0/20", "10.2.48.0/20"]
  }
  management = {
    public_subnets  = 1
    private_subnets = 1
    public_cidr     = ["10.3.0.0/21"]
    private_cidr    = ["10.3.8.0/21"]
  }
}

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]