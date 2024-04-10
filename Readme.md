## Create EC2 Instance with Terraform

Step 1: First, run you have to create AWS account and IAM user account

Open [IAM AWS docs](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html) to see how to create AWS account and IAM user

Step 2: Attach to IAM user policies such as : AdministratorAccess (you can using only Administrator ec2 policies)

Click to the user then select security credentials and then follow the instructions to create access key for IAM
user
Step 3: Paste into main.tf file at provider

```bash
provider "aws" {
  region     = "ap-southeast-1"
  access_key = "Your access key"
  secret_key = "Your secret key"
}

```

Step 4: Run this command to create and running EC2 Instance

```bash
terraform init

terraform plan

terraform apply

```
