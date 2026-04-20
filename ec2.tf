resource "aws_instance" "wordpress_instance" {
  ami                         = "ami-0a914de4dc1f18727"
  instance_type               = "t3.small"
  associate_public_ip_address = true
  key_name                    = "vockey"
  vpc_security_group_ids      = [aws_security_group.wordpress-sg.id]
  subnet_id                   = aws_subnet.public_subnet.id

  tags = {
    Name = "Wordpress-Instance"
  }
}

resource "aws_instance" "wordpress_instance" {
  ami                         = "ami-0a914de4dc1f18727"
  instance_type               = "t3.small"
  associate_public_ip_address = true
  key_name                    = "vockey"
  vpc_security_group_ids      = [aws_security_group.wordpress-sg.id]
  subnet_id                   = aws_subnet.public_subnet-2.id

  tags = {
    Name = "Wordpress-Instance"
  }
}

resource "aws_instance" "bastion-host" {
  ami                         = "ami-0a914de4dc1f18727"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = "vockey"
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  subnet_id                   = aws_subnet.public_subnet.id

  tags = {
    Name = "Bastion-Host"
  }
}
