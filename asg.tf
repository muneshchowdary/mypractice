data "aws_ami" "myproject_asg_win_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_configuration" "myproject_lc" {
  name_prefix   = "myproject-lc-"
  image_id      = data.aws_ami.myproject_asg_win_ami.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.myproject_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "myproject_asg" {
  name                 = "myproject-asg"
  launch_configuration = aws_launch_configuration.myproject_lc.name
  min_size             = 0
  max_size             = 2
  desired_capacity     = 2

  lifecycle {
    create_before_destroy = true
  }
}