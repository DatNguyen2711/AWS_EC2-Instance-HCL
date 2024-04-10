# Get latest AMI ID for Ubuntu OS
# Get Latest AWS AMI ID for Ubuntu OS
data "aws_ami" "ubuntu_aws" {
  most_recent = true
  owners      = [var.owner]
  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
