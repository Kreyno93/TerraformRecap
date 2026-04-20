# Create a Security Group for SSH, HTTP, and Mysql

resource "aws_security_group" "wordpress-sg" {
  name        = "wordpress-sg"
  description = "Allow SSH, HTTP, and MySQL traffic"
  vpc_id      = aws_vpc.wordpress_vpc.id
  tags = {
    Name = "wordpress-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "wordpress-http" {
  security_group_id = aws_security_group.wordpress-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "wordpress-ssh" {
  security_group_id = aws_security_group.wordpress-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "wordpress-mysql" {
  security_group_id = aws_security_group.wordpress-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 3306
  ip_protocol = "tcp"
  to_port     = 3306
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_ssh" {
  security_group_id = aws_security_group.wordpress-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"
  description = "Allow SSH traffic"
  vpc_id      = aws_vpc.wordpress_vpc.id
  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "bastion-ssh" {
  security_group_id = aws_security_group.bastion-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "bastion-allow_all_traffic_ipv4_ssh" {
  security_group_id = aws_security_group.bastion-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
