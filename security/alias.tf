#using alias for providers en region different than default
provider "aws" {
  alias  = "usa"
  region = "us-west-2"
}

provider "aws" {
  alias  = "paris"
  region = "eu-west-3"
}

resource "aws_instance" "ec2" {
  provider      = aws.usa
  ami           = "ami-0c5204531f799e0c6"
  instance_type = "t3.micro"
}

resource "aws_security_group" "sg" {
  provider    = aws.paris
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0bb1c1234567890ab"
}