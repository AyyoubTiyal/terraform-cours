# to fetch state from networking team S3 backend
data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "bouyya-b"
    key    = "eip.tfstate"
    region = "eu-west-3"
  }
}