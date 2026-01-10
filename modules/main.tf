provider "aws" {
  region = "eu-west-3"
}

provider "aws" {
  alias = "irland"
  region = "eu-west-1"
}

module "sg" {
  source = "./network"
  providers = {
    aws.prod = aws.irland
  }
}