resource "aws_instance" "wordpress_instance" {
  ami                         = "ami-0a914de4dc1f18727"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "vockey"
  vpc_security_group_ids      = [aws_security_group.wordpress-sg.id]
  subnet_id                   = aws_subnet.public_subnet.id
  # depends_on                = [RDS -> up to 20 minutes]
  # only use this if you have HEAVY dependencies


  tags = {
    Name = "Wordpress-Instance"
  }
}
