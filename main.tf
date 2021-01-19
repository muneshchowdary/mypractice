terraform {
    required_version= ">=0.11.0"
}

provider aws {
    version = "~> 2.0"
    region = "us-west-2"
    access_key = var.access_key
    secret_key = var.sec_key
}

resource "aws_instance" "sample" {
    
    ami = "ami-00d1b5cc1e5341681"
    instance_type = "t2.micro"
}

resource "aws_vpc" "sample" {
  cidr_block = "10.0.0.0/16"
  
}

