terraform {
  required_providers {
    aws = "~> 5.6"
  }
}

resource "aws_iam_user" "dev" {
  # validation should ensure the user
  name = "dev-user"
}

resource "aws_s3_bucket" "s3_bucket" {
  # validation should ensure the bucket name is lowercase
  bucket = "my-bucket"
}

variable "db_password" {
  type = string
  description = "password for the database"

  validation {
    condition     = length(var.db_password) >= 8

    //condition     = can(regex("[A-Z]", var.db_password))
    //condition     = can(regex("[0-9]", var.db_password))
    error_message = "The password must be at least 8 characters long."
    //error_message = "The password must contain at least one uppercase letter."
    //error_message = "The password must contain at least one number."
    
  }
}