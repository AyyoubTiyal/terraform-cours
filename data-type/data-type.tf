variable "username" {
   default = 1234
   type = number
}

variable "tags-set" {
    # the order is not preserved and duplicates are removed
    type = set(string)
    default = ["dev", "test", "dev"]
}

variable "tags-list" {
    # the order is preserved and duplicates are allowed
    type = list(string)
    default = ["dev", "test", "dev"]
}

output "tags-set" {
    value = var.tags-set
}

output "tags-list" {
   value = var.tags-list
}

/*resource "aws_iam_user" "lb" {
    name = var.username
}*/