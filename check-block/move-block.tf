resource "aws_security_group" "payment" {
  name = "payment-firewall"
}

 # if we want to change the name and use move the block
 # the same thing fo terraform state mv command like :
 # terraform state mv aws_security_group.payment aws_security_group.prod
moved {
    from = aws_security_group.payment
    to = aws_security_group.prod
}
resource "aws_security_group" "prod" {
    name = "prod-firewall"  
}
