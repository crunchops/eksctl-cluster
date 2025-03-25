# Security Group for ovpn Server
resource "aws_security_group" "ovpn_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "ovpn-server-sg" })
}

# Elastic IP for ovpn Server
resource "aws_eip" "ovpn_eip" {}

# Associate Elastic IP with ovpn Server
resource "aws_eip_association" "ovpn_eip_assoc" {
  instance_id   = aws_instance.ovpn_server.id
  allocation_id = aws_eip.ovpn_eip.id
}

# ovpn Server EC2 Instance
resource "aws_instance" "ovpn_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet
  security_groups = [aws_security_group.ovpn_sg.id]
  key_name        = var.ssh_key_name
#   iam_instance_profile = "gitaction_runner"

  user_data = file("../../modules/ec2/userdata.sh")
  

  tags = merge(var.tags, { Name = "ovpn-server" })
}
