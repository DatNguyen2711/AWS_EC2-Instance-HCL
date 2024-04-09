resource "aws_instance" "my_TF_Instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = [aws_security_group.instance_sg.name] # Gán security group cho instance
  tags = {
    Name = var.name_tag
  }
}
resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = var.key_name
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "aws_security_group" "instance_sg" {
  name   = var.security-group
  vpc_id = var.vpc-id # Thay bằng ID của VPC của bạn

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
