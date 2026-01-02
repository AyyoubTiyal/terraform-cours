provider "aws" {
  region = "eu-west-3"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}

#output Ip address of the Elastic IP
output "eip_ip_address" {
  value = aws_eip.lb.public_ip
}
# resource "aws_security_group" "allow_tls" {
#   name        = "terraform-attribute"
#   description = "created from terraform"
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = "${aws_eip.lb.public_ip}/32"
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }