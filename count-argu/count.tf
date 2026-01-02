provider "aws" {
  region    = "eu-west-3"
}



resource "aws_instance" "many-instance" {
    ami = "ami-078abd88811000d7e"
    instance_type = "t3.micro"
    count = 3

    tags = {
    #to make unique names for each instance
      name = "payments-system-${count.index}"
    }
 }

 variable "users" {
  type = list
  default = ["Ayyoub", "Meriyeme", "Assyle"]
}

 resource "aws_iam_user" "iam-user" {
  #to create multiple iam users
   name = var.users[count.index]
   count = 3
 }

#create multiple instances with different instance types
resource "aws_instance" "multi-type-instance" {
    count         = 3
    ami           = "ami-078abd88811000d7e"
    instance_type = ["t3.micro", "t3.small", "t3.medium"][count.index]

    tags = {
        name = "multi-type-instance-${count.index}"
    }
}