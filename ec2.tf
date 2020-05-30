provider "aws" {
  region = "${var.aws_region}"
}

# VPC
resource "aws_vpc" "terraformVPC" {
  cidr_block = "${var.vpc_cidr_range}"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "Terraform VPC"
    Location = "canada"
  }
}

# Internet Gateway to connect to the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.terraformVPC.id}"
  tags = {
    Name = "IGW"
  }
}

# Public Subnet
resource "aws_subnet" "terrformPublicSubnet" {
  vpc_id = "${aws_vpc.terraformVPC.id}"
  availability_zone = "ca-central-1a"
  cidr_block = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

# Public Subnet's Route Table
# attach the igw to the public route table
resource "aws_route_table" "publicRouteTable" {
  vpc_id = "${aws_vpc.terraformVPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "Public RT"
  }
}

# Associate the public subnet route table with the public subnet
resource "aws_route_table_association" "publicRTAssociation" {
  subnet_id = "${aws_subnet.terrformPublicSubnet.id}"
  route_table_id = "${aws_route_table.publicRouteTable.id}"
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

# attach the igw to the main route table so that the vpc can connect to the internet
/* resource "aws_route" "defaultRouteTable" {
  route_table_id = "${aws_vpc.terraformVPC.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw.id}"
  tags = {
    Name = "Default RT"
  }
} */

/* resource "aws_instance" "myFirstInstance" {
  ami           = "${lookup(var.aws_ami, var.aws_region)}"
  instance_type = "t2.micro"
  tags {
    Name = "Web Server"
  }
  # hibernation = true - for this to work, the root volume should be encrypted
  # by default, the root volume is not encrypted
} */