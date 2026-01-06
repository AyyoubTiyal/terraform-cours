resource "aws_iam_user" "dev" {
  name = "user-01"
}

resource "aws_security_group" "prod" {
  name = "terraform-firewall"
}

resource "local_file" "demo" {
  content = "Hello, Terraform!"
  filename = "${path.module}/hello.txt"
}

# To target only a resource during apply, use:
# terraform apply -target=aws_iam_user.dev
# terraform apply -target=aws_security_group.prod
# terraform apply -target=local_file.demo