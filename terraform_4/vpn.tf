resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "VPC-test"
    name = "test"
    env = "develop"
  }
}

resource "aws_vpc" "vpc_irish" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "VPC-test"
    name = "test"
    env = "develop"
  }
  provider = aws.ireland
}