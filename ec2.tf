resource "aws_instance" "wordpress_instance" {
  ami                         = "ami-0a914de4dc1f18727"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "vockey"
  security_groups             = []
  subnet_id                   = aws_subnet.public_subnet.id
  tags = {
    Name = "Wordpress-Instance"
  }
}
