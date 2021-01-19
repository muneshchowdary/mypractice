terraform {
    required_version= ">=0.11.0"
}

provider aws {
    version = "~> 2.0"
    region = eu-west-1
}

resource "aws_instance" "sample"{
    
    ami = 
    type = t2.micro
}


