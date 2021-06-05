resource "aws_security_group" "myproject_sg" {
  name        = "myproject-sg"
  description = "Allow TLS inbound and outbound traffic"
  vpc_id      = aws_vpc.mypractice_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.mypractice_vpc.cidr_block]
  }

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.mypractice_vpc.cidr_block]
  }

  ingress {
    description = "rdp from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.mypractice_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "mypractice"
    owner   = "munesh"
    purpose = "practice"
  }
}