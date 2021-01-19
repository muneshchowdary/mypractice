terraform {
  required_version = ">=0.11.0"
}

provider "aws" {
  version    = "~> 2.0"
  region     = "us-west-2"
  access_key = "AKIAZLXVCJEQ53XJX4FT"
  secret_key = "F7bf1ymSmzFS9leKJ/T/lXP+ApFLIwmSvmaNgB4P"
}

resource "aws_instance" "sample" {

  ami           = "ami-00d1b5cc1e5341681"
  instance_type = "t2.micro"

}

resource "aws_vpc" "sample_vpc" {
  cidr_block = "10.0.0.0/16"

}
