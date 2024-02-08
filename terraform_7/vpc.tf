
resource "aws_vpc" "vpc_francoforte" {
  cidr_block = var.francoforte_cidr
  tags = {
    Name = "VPC-Francoforte"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_francoforte.id 
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
   tags = {
    Name = "Public Subnet "
  } 
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_francoforte.id 
  cidr_block = var.subnets[1]
   tags = {
    Name = "Private Subnet"
  }
  depends_on = [

    aws_subnet.public_subnet
  ]
    
  
}

///      ami-0c0d3776ef525d5dd   frankfurt  ///