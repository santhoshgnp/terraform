provider "aws" {

          region  = "us-east-1"

          access_key = "AKIASQ3KCLAJLD7IYBOV"

          secret_key = "Y+lKPv6tJ6qfK3cxUgc3LmckG6gon/i1M02sRCzY"
}
resource "aws_instance" "example" {
  ami           = "ami-0574da719dca65348"
  instance_type = "t2.micro"
}
resource "aws_vpc" "demo-vpc" {
  cidr_block       = "10.10.0.0/16"

  tags = {
    Name = "demo-vpc"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.10.10.0/24"



 tags = {
    Name = "Public subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.10.20.0/24"



 tags = {
    Name = "Private subnet"
  }
}
