# to link the workspace terraform with the hcp platform
terraform { 
  cloud { 
    
    organization = "Bouyya-Terraform-Learning" 

    workspaces { 
      name = "hcp-latform" 
    } 
  } 
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "ec2" {
  ami           = "ami-078abd88811000d7e"
  instance_type = "t3.micro"
}