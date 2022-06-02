provider "aws" {
     shared_credentials_file = "~/..aws/credentials"
  
  region                   = var.region
}

resource "aws_vpc" "sitevpc" {
    instance_tenancy = "default"
    cidr_block = var.cidr1

    tags = {
    Name =    "prodvpc"
    }
}

resource "aws_instance" "feyi_server" {
    ami         = var.ami
    instance_type = "t2.micro"
   
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
     
     tags = {
    Name = "aws_machine"
  }
}

resource "aws_instance" "aws_main" {
  ami           = var.ami2
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-aws-server"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh"


  ingress {

    from_port = 22 #
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
  
