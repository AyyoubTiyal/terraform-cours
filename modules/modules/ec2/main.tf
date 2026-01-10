terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }

}

provider "aws" {
    region = var.region
}

resource "aws_instance" "ec2_instance" {
    ami           =var.ami  //"ami-0c55b159cbfafe1f0"
    instance_type = var.instance_type //"t3.micro"
    
    tags = {
        Name = "myec2"
    }
  
}

