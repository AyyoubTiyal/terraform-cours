terraform {
  backend "s3" {
    bucket = "bouyya-demo-23"
    key = "prod.tfstate"
    region = "eu-west-3"
    use_lockfile = true
  }
}