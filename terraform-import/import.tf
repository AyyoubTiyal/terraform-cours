# from the version 1.5 of terraform you can import resources with configuration only
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "eu-west-3"
}

# import an existing security group
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
}
# to import use the command:
# terraform import aws_security_group.allow_tls sg-0bb1c1234567890ab
# import an existing security group ingress rule

import {
  to = "aws_vpc_security_group_ingress_rule.allow_tls_inbound"
  id = "id_of_g"
}

# to remove a block from terraform file .tf use the following remove block
removed {
  from = aws_security_group.allow_tls
  lifecycle {
    destroy = false
  }
}