terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "instance1" {
  ami             = "ami-0a0b32e2a2495c9f3"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance1_name
  }
}

resource "aws_instance" "instance2" {
  ami             = "ami-0a0b32e2a2495c9f3"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance2_name
  }
}
