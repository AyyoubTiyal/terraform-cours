resource "aws_instance" "myec2" {
  instance_type = "t3.micro"
  ami = "ami-123"

  lifecycle {
    # preconditions
    precondition {
      condition = "self.instance_type == 't3.micro'"
      error_message = "The instance type must be t3.micro"
    }

    # postconditions
    postcondition {
      condition     = "self.ami != ''"
      error_message = "The AMI ID must not be empty"
    }
  }
}