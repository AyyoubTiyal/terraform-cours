resource "aws_instance" "ec2" {
  ami = "ami-12443"
  instance_type = "t3.micro"

  # to add implicit dependency on security group
  # for more details view doc terraform
  vpc_security_group_ids = [aws_security_group.prod.id]

}

resource "aws_security_group" "prod" {
    name = "prod-sg"
  
}