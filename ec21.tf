resource "aws_instance" "alb2" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
  subnet_id = "subnet-079512d0ab954a691"
  key_name="Apache"
  user_data = <<EOF
  #!/bin/bash
yum update -y
yum install httpd -y 
systemctl enable httpd
systemctl start httpd
mkdir -p  /var/www/html/cricket/
echo "this is cricket" >/var/www/html/cricket/index.html
EOF
  tags = {
    Name = "ALB1"
    Company = "Testing"
    Team = "Dev"
  }
}