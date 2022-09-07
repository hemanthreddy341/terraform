resource "aws_lb_target_group" "target-1" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-08b833ab8c86686ed"
}
resource "aws_lb_target_group_attachment" "test_foot" {
  target_group_arn = aws_lb_target_group.target-1.arn
  target_id        = aws_instance.alb1.id
  port             = 80
}
resource "aws_lb_target_group" "target-2" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-08b833ab8c86686ed"
}
resource "aws_lb_target_group_attachment" "test1_cric" {
  target_group_arn = aws_lb_target_group.target-2.arn
  target_id        = aws_instance.alb2.id
  port             = 80
}