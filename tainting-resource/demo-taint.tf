resource "aws_instance" "myec2" {
  ami = "ami-078abd88811000d7e"
  instance_type = "t3.micro" 
}

#next we will apply terraform apply -replace="aws_instance.myec2" to replace the resource
#before it was terraform taint aws_instance.myec2