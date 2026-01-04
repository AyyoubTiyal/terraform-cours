provider "aws" {
  region = "eu-west-1"
}

data "aws_ami" "myimage" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name   = "name"
        values = ["ubuntu/images-testing/hvm-ssd-gp3/ubuntu-noble-daily-amd64-server-*"]
    }
}

resource "aws_instance" "web" {
  ami = data.aws_ami.myimage.image_id
  instance_type = "t3.micro"
}
