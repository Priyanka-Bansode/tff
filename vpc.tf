resource "aws_vpc" "first" {
  cidr_block       = "70.70.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}


resource "aws_subnet" "demo1" {
  vpc_id     = "$(aws_vpc.first.id)"
  cidr_block = "70.70.1.0/28"

  tags = {
    Name = "subnet1"
  }
}


resource "aws_subnet" "demo2" {
  vpc_id     = "$(aws_vpc.first.id)"
  cidr_block = "70.70.1.16/28"

  tags = {
    Name = "subnet2"
  }
}
resource "aws_internet_gateway" "intdemo" {
  vpc_id = "$(aws_vpc.first.id)"

  tags = {
    Name = "mass"
  }
}
resource "aws_route_table" "Public-RT" {
  vpc_id = "$(aws_vpc.first.id)"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.intdemo.id
  }

  tags = {
    Name = "massian"
  }
}
resource "aws_route_table" "Private-RT" {
  vpc_id = "$(aws_vpc.first.id)"
  }
