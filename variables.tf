variable "aws_region" {
    description = "AWS region to launch servers"
    default = "ca-central-1"
}

# Linux based amis
variable "aws_ami" {
    default = {
        ca-central-1 = "ami-0f75c2980c6a5851d"
    }
}

# VPC CIDR
variable "vpc_cidr_range" {
    default = "10.0.0.0/16"
}

# Public Subnet CIDR
variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
}

# Private Subnet CIDR
variable "private_subnet_cidr" {
    default = "10.0.2.0/24"
}