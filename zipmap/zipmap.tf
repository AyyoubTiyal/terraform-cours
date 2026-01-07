resource "aws_iam_user" "lb" {
  name = "user_${count.index}"
  count = 3
  path = "/system/"
}

output "user_names_combined" {
  value = zipmap(
    aws_iam_user.lb.*.arn,
    aws_iam_user.lb.*.name
  )
}
