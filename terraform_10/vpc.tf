
resource "aws_vpc" "vpc_francoforte" {
  cidr_block = var.francoforte_cidr
  tags = {
    Name = "VPC-publica-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_francoforte.id 
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
   tags = {
    Name = "Public Subnet-${local.sufix}"
  } 
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_francoforte.id 
  cidr_block = var.subnets[1]
   tags = {
    Name = "Private Subnet-${local.sufix}t"
  }
  depends_on = [

    aws_subnet.public_subnet
  ]
    
  
}

///      ami-0c0d3776ef525d5dd   frankfurt  ///


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_francoforte.id

  tags = {
    Name = "ITGW vpc Francoforte-${local.sufix}"
  }
}

resource "aws_route_table" "francoforte" {
  vpc_id = aws_vpc.vpc_francoforte.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "francoforte"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.francoforte.id
}

resource "aws_security_group" "sg_francoforte_cidr" {
  name        = "francoforte-tls"
  description = "Allow TLS inbound traffic and egress"
  vpc_id      = aws_vpc.vpc_francoforte.id

  # ingress {
  #   description      = "SSh over Internet"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = [var.sg_francoforte_cidr]
  # }
  #  ingress {
  #   description      = "http over Internet"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks      = [var.sg_francoforte_cidr]
  # }

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg_francoforte_cidr]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "francoforte-tls"
  }
}