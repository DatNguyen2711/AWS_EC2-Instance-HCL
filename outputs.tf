# Terraform Output Values
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.my_TF_Instance.public_ip
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.my_TF_Instance.private_ip
}

output "instance_type" {
  description = "EC2 Instance Type"
  value       = aws_instance.my_TF_Instance.instance_type
}
