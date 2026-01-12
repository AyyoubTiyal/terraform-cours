terraform {
  backend "s3" {
    bucket = "bouyya-b"
    key = "eip.tfstate"
    region = "eu-west-3"
    use_lockfile = true
  }
}