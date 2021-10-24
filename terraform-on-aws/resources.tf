resource "aws_vpc" "terra-vpc" {
  cidr_block = var.vpc_cir_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  
}
resource "aws_subnet" "terra-pub-sub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = var.pub_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-pub-sub1"
  }
}
resource "aws_subnet" "terra-priv-sub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = var.priv_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-pub-sub2"
  }
}
resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra-vpc.id 
}

resource "aws_route_table" "my_table" {
  vpc_id = aws_vpc.terra-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-igw.id
  }

}
resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.terra-pub-sub1.id
  route_table_id = aws_route_table.my_table.id
}




