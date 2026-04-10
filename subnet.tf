resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.wordpress_vpc.id # Reference
  cidr_block = "172.16.0.0/26"

  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.wordpress_vpc.id # Reference
  cidr_block = "172.16.0.64/26"

  tags = {
    Name = "Private-Subnet"
  }
}
