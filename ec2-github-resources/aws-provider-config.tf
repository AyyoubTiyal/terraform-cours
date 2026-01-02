
resource "aws_instance" "myec2" {
  ami           = "ami-078abd88811000d7e"
  instance_type = "t3.micro"
}
/*
provider "aws" {
  region     = "eu-west-3"
}

resource "aws_iam_user" "demouser" {
  name = "demouser_terraform"
}

resource "aws_instance" "myec2_instance" {
  ami           = "ami-078abd88811000d7e"
  instance_type = "t3.micro"

  tags = {
    Name = "MyFirstEC2Instance"
  }
}
*/










