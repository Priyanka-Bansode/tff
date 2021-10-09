resource "aws_vpc" "demo123" {
  cidr_block       = "70.60.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}


resource "aws_subnet" "demo1" {
  vpc_id     = aws_vpc.demo123.id
  cidr_block = "70.60.1.0/28"

  tags = {
    Name = "subnet1"
  }
}


resource "aws_subnet" "demo2" {
  vpc_id     = aws_vpc.demo123.id
  cidr_block = "70.60.1.16/28"

  tags = {
    Name = "subnet2"
  }
}
resource "aws_internet_gateway" "massgw" {
  vpc_id = aws_vpc.demo123.id

  tags = {
    Name = "mass"
  }
}
resource "aws_route_table" "Pu_RT" {
  vpc_id = aws_vpc.demo123.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.massgw.id
  }

  tags = {
    Name = "massian"
  }
}
resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.demo123.id
  }
