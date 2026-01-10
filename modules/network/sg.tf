terraform {
  required_providers {
    aws = {
        configuration_aliases = [ aws.prod ]
    }
  }
}


resource "aws_security_group" "dev" {
  name = "dev-sg"
}

resource "aws_security_group" "prod" {
  name = "prod-sg"
  provider = aws.prod
}

# to create security groups in different regions using provider aliasing
# the alias is defined in the root module (main.tf)