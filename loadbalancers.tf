# This module is creating the network load balancer with in instances#
# if we want to configure with the asg need to attach the "target_group_arn" in the asg#
# However i am not currently implementing the asg, that time i will allow the above mentioned configuration#
# commenting out the config for the ip address#

resource "aws_lb" "mypractice_nlb" {
  name               = "mypractice-nlb"
  internal           = true      # this is configuring the nlb to true = public, false = private
  load_balancer_type = "network" #/"application" used for the application load balancer
  subnets            = aws_subnet.mypractice_subnet.*.id

  enable_deletion_protection = false

  tags = {
    Environment = "Testing"
  }
}

resource "aws_lb_listener" "mypractice_listener" {
  load_balancer_arn = aws_lb.mypractice_nlb.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mypractice_targetgroup.arn
  }
}


#for configuration with in Instance level this Target Group is used
resource "aws_lb_target_group" "mypractice_targetgroup" {
  name     = "mypractice-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mypractice_vpc.id
}

# for configuration with in IP address this Target Group is used
#resource "aws_lb_target_group" "ip-example" {
#  name        = "tf-example-lb-tg"
#  port        = 80
#  protocol    = "HTTP"
#  target_type = "ip"
#  vpc_id      = aws_vpc.main.id
#}

resource "aws_lb_target_group_attachment" "mypractice_tg_attachment" {
  target_group_arn = aws_lb_target_group.mypractice_targetgroup.arn
  target_id        = aws_instance.mypractice_instance.id
  port             = 80
}