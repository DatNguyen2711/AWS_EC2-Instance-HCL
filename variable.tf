variable "ami" {
  type        = string
  description = "Ubuntu AMI ID in ap-southeast-1 Region"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "access_key" {
  type        = string
  description = "Access key of TF-user in IAM"
}

variable "key_name" {
  type        = string
  description = "Your key names"
}
variable "secret_key" {
  type        = string
  description = "Secret key of TF user in IAM"
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "vpc-id" {
  type        = string
  description = "Your VPC ID"
}


variable "security-group" {
  type        = string
  description = "Security group for Terraform EC2 instance"

}

