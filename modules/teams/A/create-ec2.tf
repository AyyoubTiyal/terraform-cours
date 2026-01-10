module "myec2"  {
  source = "../../modules/ec2"
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  region = "eu-west-3"  
}