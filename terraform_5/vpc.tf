
resource "aws_vpc" "my_vpc" {
  cidr_block = var.francoforte_cidr
  tags = {
    Name = "VPC-test"
    name = "test"
    env = "develop"
  }
}

resource "aws_vpc" "vpc_ireland" {
  cidr_block = var.ireland_cidr
  tags = {
    Name = "VPC-test"
    name = "test"
    env = "develop"
  }
  provider = aws.ireland
}