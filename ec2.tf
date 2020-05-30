provider "aws" {
  region = "${var.aws_region}"
}

# VPC
resource "aws_vpc" "terraformVPC" {
  cidr_block = "${var.vpc_cidr_range}"
  instance_tenancy = "default"
  tags = {
    Name = "Terraform VPC"
    Location = "canada"
  }
}

# Public Subnet
resource "aws_subnet" "terrformPublicSubnet" {
  vpc_id = "${aws_vpc.terraformVPC.id}"
  availability_zone = "ca-central-1a"
  cidr_block = "${var.public_subnet_cidr}"
  tags = {
    Name = "Public Subnet"
  }
}

# Private Subnet
resource "aws_subnet" "terraformPrivateSubnet" {
  vpc_id = "${aws_vpc.terraformVPC.id}"
  availability_zone = "ca-central-1b"
  cidr_block = "${var.private_subnet_cidr}"
  tags = {
    Name = "Private Subnet"
  }
}

# Internet Gateway to connect to the VPC
/* resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myVPC.id}"
}

resource "aws_instance" "myFirstInstance" {
  ami           = "${lookup(var.aws_ami, var.aws_region)}"
  instance_type = "t2.micro"
  tags {
    Name = "Web Server"
  }
  # hibernation = true - for this to work, the root volume should be encrypted
  # by default, the root volume is not encrypted
} */