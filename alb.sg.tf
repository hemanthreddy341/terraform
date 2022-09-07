resource "aws_security_group" "alb_sg" {
  name        = "alb"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-08b833ab8c86686ed"

  ingress {
    description      = "from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "alb_sg"
  }
}