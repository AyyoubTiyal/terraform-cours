resource "aws_security_group" "prod" {
  name = "prod-sg"
}

# the terraform.tfstate are stored in the backend directory like S3
# backeend block view it in terraform documentation
# Exemple : 
/*
terraform {
  backend "s3" {
    path    = "path/to/my/terraform.tfstate"
    bucket  = "my-terraform-state-bucket"
    region  = "eu-west-3"
    encrypt = true
  }
}
*/

# Exemple of local
terraform {
  backend "local" {
    # a file was created with the name prod.tfstate in the backend directory instead of terraform.tfstate
    path = "prod.tfstate"
  }
}   