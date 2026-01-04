resource "aws_security_group" "dynamicsg" {
  name = "dynamicsg"

  #using dynamic block to create multiple ingress rules, instead of writing multiple ingress blocks
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


variable "sg_ports" {
  type    = list(number)
  default = [8200, 8201, 9200, 9500]
}