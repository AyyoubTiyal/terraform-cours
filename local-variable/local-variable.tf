variable "tags" {
  type = map  
  default = {
    team = "security-team"
    # you can not do that i  here
    #creation_date = "date-${formatdate("YYYY-MM-DD", timestamp())}"
  }
}

locals {
  default = {
    team = "security-team"
    #do it here
    creation_date = "date-${formatdate("YYYY-MM-DD", timestamp())}"
  }
}


resource "aws_security_group" "sg-01" {
    name = "app_firewall"
    tags = local.default #or var.tags
}

resource "aws_security_group" "sg-02" {
    name = "app_firewall"
    tags = local.default # or var.tags
}