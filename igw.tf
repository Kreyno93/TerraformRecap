resource "aws_internet_gateway" "wordpress-igw" {
  vpc_id = aws_vpc.wordpress_vpc.id # Attachment

  tags = {
    Name = "Wordpress-igw"
  }
}
