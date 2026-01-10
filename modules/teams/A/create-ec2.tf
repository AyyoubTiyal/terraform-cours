module "myec2"  {
  source = "../../modules/ec2"
  ami = "ami-078abd88811000d7e"
  instance_type = "t3.micro"
  region = "eu-west-3"  
}


resource "aws_eip" "lb" {
# Associate the EIP with the EC2 instance created by the module
# Use module output to get the instance ID
# the output is declared in modules/ec2/main.tf
  instance = module.myec2.instance_id
  domain = "vpc"
}