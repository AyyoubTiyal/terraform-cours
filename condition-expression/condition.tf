variable "environement" {
  default = "developnt"
}

variable "region" {
  default = "eu-west-3"
}

resource "aws_instance" "myEc2" {
    ami           = "ami-078abd88811000d7e"
   // instance_type = var.environement == "development" && var.region == "eu-west-3" ? "t3.micro" : "t3.large"
    instance_type = var.environement == "development" || var.region == "eu-west-3" ? "t3.micro" : "t3.large"
  
}