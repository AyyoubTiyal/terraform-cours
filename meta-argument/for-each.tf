variable "iam_names" {

  type    = set(string)
  default = ["admin", "developer", "tester", "manager"]
}

resource "aws_iam_user" "users" {
    for_each = var.iam_names
    name  = each.value
    path  = "/"
}