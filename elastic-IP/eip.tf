provider "aws" {
  region = "eu-west-3"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}