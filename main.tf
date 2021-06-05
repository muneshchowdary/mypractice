terraform {
    required_version= ">=0.11.0"
}

provider aws {
    version = "~> 2.0"
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.sec_key
}

resource "aws_instance" "mypractice_instance" {
    
    ami = "ami-05ce3abcaf51f14b2"
    instance_type = "t2.micro"

    tags = {
        Name = "mypractice"
        owner = "munesh"
        purpose = "practice"
    }
}

resource "aws_vpc" "mypractice_vpc" {
    
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "mypractice"
      owner = "munesh"
      purpose = "practice"
  }  
}

resource "aws_subnet" "mypractice_subnet" {
    
    vpc_id            = aws_vpc.mypractice_vpc.id
    cidr_block        = "mypractice_vpc"
    availability_zone = "us-east-1"

    tags = {
      Name = "mypractice"
      owner = "munesh"
      purpose = "practice"
  }
}
