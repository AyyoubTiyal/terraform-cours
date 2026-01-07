resource "aws_iam_user" "lb" {
  name = "loadbalancer"

  provisioner "local-exec" {
    command = "local-exec provisioner is starting"
    on_failure = continue
  }
}