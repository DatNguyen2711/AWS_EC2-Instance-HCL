terraform {
  cloud {
    organization = "Datlaid-FPT"

    workspaces {
      name = "p1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA6GBMG5EXZXQ6CCXC"
  secret_key = "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"
}


resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = "datlaidaws12.pem"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "datlaidaws12.pem"
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "aws_instance" "TF_Instance_02" {
  ami             = "ami-06c4be2792f419b7b"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = [aws_security_group.instance_sg.name] 
  tags = {
    Name = "TF Second Instance"
  }
}



resource "aws_security_group" "instance_sg" {
  name        = "instance-tf-group"
  vpc_id      = "vpc-07ba57048143490ea" # Thay bằng ID của VPC của bạn
  description = "Security group for Terraform EC2 instance"

  // Tạo các rule cho security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cho phép từ mọi địa chỉ IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cho phép từ mọi địa chỉ IP
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cho phép từ mọi địa chỉ IP
  }
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cho phép từ mọi địa chỉ IP
  }
}
