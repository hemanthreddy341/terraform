resource "aws_security_group" "ec2_sg" {
  name        = "ec2"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-08b833ab8c86686ed"
  
  ingress {
    description      = "for Admin"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.110.170.86/32"]
  }
  
  ingress {
    description      = "for Admin"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = ["${aws_security_group.alb_sg.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ec2_sg"
  }
}