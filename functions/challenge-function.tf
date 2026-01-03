provider "aws" {
  region = var.region
}

variable "region" {
    default = "eu-west-3"
    
}

variable "tags" {
  type = list
  default = ["dev", "prod"]
}

variable "ami" {
  type = map
  default = {
    "eu-west-1" = "ami-123"
    "eu-west-2" = "ami-654"
    "eu-west-3" = "ami-987"
  }
}

resource "aws_instance" "app-dev" {
    ami = lookup(var.ami, var.region)
    instance_type = "t3.micro"
    count = length(var.tags)

    tags = {
        name= element(var.tags, count.index)
        creation_date = formatdate("YYYY-MM-DD", timestamp())
    }
}