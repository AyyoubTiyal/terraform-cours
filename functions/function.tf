resource "aws_iam_user" "this" {
  name = "demouser"
}

resource "aws_iam_user_policy" "lb_ro" {
    name = "demouser_policy"
    user = aws_iam_user.this.name

    #attach policy from external file 
    policy = file("policy.json")
}