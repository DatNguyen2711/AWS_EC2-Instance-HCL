
### Create EC2 Instance with Terraform
![image](https://github.com/DatNguyen2711/EC2-Instance-HCL/assets/81822483/04e4c7e0-5125-42a5-a632-75ccd69eab92)

## Step 1: First, run you have to create AWS account and IAM user account (follow the bellow instructions)
Open [IAM AWS docs](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html) to see how to create AWS account and IAM user

You can choose Provide user access to the AWS Management Console - optional if you want to change password when sign in with this user
![image](https://github.com/DatNguyen2711/EC2-Instance-HCL/assets/81822483/6e56707c-5bc3-47d9-948d-d8526f104202)


Then attach policies for this account ( you can attach only EC2 perrmission if you want)
![image](https://github.com/DatNguyen2711/EC2-Instance-HCL/assets/81822483/4df8bdf2-408b-4ef2-9472-d6dc3bda6427)

![image](https://github.com/DatNguyen2711/EC2-Instance-HCL/assets/81822483/eb6d59ff-ddf1-4c9c-81b5-bf6f573014df)



## Step 2: Attach to IAM user policies such as : AdministratorAccess (you can using only Administrator ec2 policies)

Click to the user then select security credentials and then follow the instructions to create access key for IAM
user (follow to the bellow instructions)
![image](https://github.com/DatNguyen2711/Pharmacy-Web/assets/81822483/cbeee82a-e05b-4449-ab5a-fd450cbb51f1)
then...
![image](https://github.com/DatNguyen2711/Pharmacy-Web/assets/81822483/e738ac15-12a3-406b-aad9-6cda8c7c84b9)
![image](https://github.com/DatNguyen2711/Pharmacy-Web/assets/81822483/fb448382-f8d7-413b-9f9f-8c0f110daa6d)
then name your tag, here is your access key
![image](https://github.com/DatNguyen2711/Pharmacy-Web/assets/81822483/9bf0abe7-6155-4b7a-9843-1d045ef6177b)


## Step 3: Paste into main.tf file at provider

```bash
provider "aws" {
  region     = "ap-southeast-1"
  access_key = "Your access key"
  secret_key = "Your secret key"
}

```

## Step 4: Run this command to create and running EC2 Instance

```bash
terraform init

terraform plan

terraform apply

```
