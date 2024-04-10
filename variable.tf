variable "ami" {
  type        = string
  description = "Ubuntu AMI ID in ap-southeast-1 Region"
  nullable    = false
  sensitive   = true

}
# Setting a variable as sensitive prevents 
# Terraform from showing its value in the plan or apply output, 
# when you use that variable elsewhere in your configuration.
variable "instance_type" {
  type        = string
  description = "Instance type"
  nullable    = false
  default     = "t2.micro"

}

variable "access_key" {
  type        = string
  description = "Access key of TF-user in IAM"
  nullable    = false

}

variable "key_name" {
  type        = string
  description = "Your key names"
  sensitive   = true
  nullable    = false

}
variable "secret_key" {
  type        = string
  description = "Secret key of TF user in IAM"
  sensitive   = true
  nullable    = false

}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  nullable    = false

}
variable "owner" {
  type        = string
  description = "Owner of the instance"
  nullable    = false

}
variable "vpc-id" {
  type        = string
  description = "Your VPC ID"
  sensitive   = true
  nullable    = false

}


variable "security-group" {
  type        = string
  description = "Security group for Terraform EC2 instance"
  nullable    = false

}

