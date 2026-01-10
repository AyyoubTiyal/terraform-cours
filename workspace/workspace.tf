#to create diferent instance type for 2 workspaces
locals {
  instance_type = {
    default = "t3.nano"
    dev = "t3.micro"
    prod = "t3.small"
  }
}

resource "aws_instance" "myec2" {
  ami = "ami-0f95dedaf2f938d49"
  instance_type = local.instance_type[terraform.workspace]
}