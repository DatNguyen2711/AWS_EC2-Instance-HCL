resource "aws_instance" "my_TF_Instance" {
  ami             = data.aws_ami.ubuntu_aws
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
