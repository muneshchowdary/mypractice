terraform {
    required_version= ">=0.11.0"
}

provider aws {
    version = "~> 2.0"
    region = "us-west-2"
}

resource "aws_instance" "sample" {
    
    ami = "ami-00d1b5cc1e5341681"
    type = "t2.micro"
}


