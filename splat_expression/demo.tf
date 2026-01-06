resource "aws_iam_user" "lb" {
  name = "user.${count.index}"
  count=3
  path = "/system/"
}

output "arns" {
# Using splat expression to get all ARNs of created IAM users
  value = aws_iam_user.lb[*].arn
}