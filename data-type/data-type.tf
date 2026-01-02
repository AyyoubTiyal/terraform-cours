variable "username" {
   default = 1234
   type = number
}

resource "aws_iam_user" "lb" {
    name = var.username
}