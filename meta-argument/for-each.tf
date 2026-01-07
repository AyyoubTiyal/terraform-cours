variable "iam_names" {
  type    = set(string)
  default = ["admin", "developer", "tester", "manager"]
}

resource "aws_iam_user" "users" {
    for_each = var.iam_names
    name  = each.value
    path  = "/"
}

variable "mymap" {
  type = map
  default = {
    dev = "ami-123"
    prod = "ami-567"
  }
}

resource "aws_instance" "web" {
  for_each = var.mymap
  ami = each.key
  instance_type = "t3.micro"

  tags = {
    Name = each.value
  }
}