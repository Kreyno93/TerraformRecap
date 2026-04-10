resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "Public-Rtb"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rtb.id
}
