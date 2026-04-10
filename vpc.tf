resource "aws_vpc" "wordpress_vpc" {
  cidr_block = "172.16.0.0/24"

  tags = {
    Name        = "wordpress_vpc"
    Environment = "test"
  }
}
