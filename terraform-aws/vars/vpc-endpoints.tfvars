region = "us-east-1"

environments = {
  dev = {
      vpc_id            = "vpc-0c29cbcedcce79bb1"
      security_group_ids = ["sg-0fdc42281478bbd6d", "sg-00cc9b12408d12917", "sg-0fef0cb2d3352b6e5"]
      subnet_ids        = ["subnet-0272b68cca109c1f2", "subnet-0378671215219ca68", "subnet-0cd7b8f06b59893ce"]
      deploy            = true
    }
  stage = {
    vpc_id            = ""
    security_group_ids = []
    subnet_ids        = []
    deploy            = false
  }
  prod = {
    vpc_id            = ""
    security_group_ids = []
    subnet_ids        = []
    deploy            = false
  }
}