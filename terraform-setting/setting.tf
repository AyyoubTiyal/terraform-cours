#setting for terraform
terraform {
# specify the required terraform version
  required_version = "1.14.3"
# specify the required provider and its version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
    #backend configuration for storing terraform state in S3
    #optional: you can remove this block to use local state
    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key    = "path/to/my/terraform.tfstate"
        region = "eu-west-3"
    }
    #optional settings to enhance terraform performance and security
    experiments = [ provider_sensitive_attrs ]
}

resource "aws_security_group" "sg-01" {
  name = "app-firewall"
}