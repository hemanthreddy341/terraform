resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb_sg.id}"]
  subnets            = ["subnet-0b5da5e5e4a7282b5",
                        "subnet-079512d0ab954a691"]


  tags = {
    Environment = "production"
  }
}
#alb listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-1.arn
  }
}
#alb listener rule1
resource "aws_lb_listener_rule" "static1" {
  listener_arn = aws_lb_listener.listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-1.arn
  }

  condition {
    path_pattern {
      values = ["/cricket/*"]
    }
  }
}
#alb listener rule2
resource "aws_lb_listener_rule" "static2" {
  listener_arn = aws_lb_listener.listener.arn
 

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-2.arn
  }

  condition {
    path_pattern {
      values = ["/football/*"]
    }
  }
}