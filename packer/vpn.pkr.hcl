packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.0.0"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">= 1.0.0"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name                  = "openvpn-ami-{{timestamp}}"
  instance_type             = "t2.medium"
  region                    = "us-east-1"
  source_ami                = "ami-084568db4383264d4" 
  ssh_username              = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./ansible/playbooks/main.yml"
    extra_arguments = ["-vvv"]
  }
}
