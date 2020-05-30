# terraform101
Creating infrastructures in AWS using Terraform

# Prerequisites
AWS CLI should be installed in your system. 'aws configure' should be set up with the access key and secret access key.

# Installing Terraform
Terraform can be downloaded from [here](https://www.terraform.io/downloads.html)

Mac users:
Once you have installed Terraform by unzipping and double clicking the terraform executable, you have to add the location to the system path. You can do this by:

```echo $"export PATH=\$PATH:$PATH:$(pwd)" >> ~/.bash_profile```

Then, load the env variable into the terminal by

```source ~/.bash_profile```

To check if Terraform is installed correctly:

```terraform --version```

If its installed correctly, you will see a version number.

# About the project
This project creates a tiered infrastructure (from now being referred to as 'infra'). 
This infra consists of :
* VPC (CIDR range: 10.0.0.0/16)
* Public Subnet (10.0.1.0/24) and its route table
* Private Subnet (10.0.2.0/24) and its route table

# Current status
Infra with the VPC along with public and private subnets have been set up. 

# What next
Next in line, security groups, NACLs and instances.
Modifying the variables.tf and other functionalities.

# Files used
* ec2.tf - This is the main file which has the full infra code
* variables.tf