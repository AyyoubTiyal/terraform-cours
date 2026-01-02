variable "list" {
    type = list(string)
    default = ["apple", "banana", "orange"]
}

variable "map" {
  type = map
  default = {
    name = "John"
    age  = "30"
    city = "New York"
  }
}


resource "aws_instance" "ec2" {
    ami           = "ami-078abd88811000d7e"
    instance_type = "t3.micro"
    
    tags = {
        Name = var.map["name"]
        Age  = var.map["age"]
        City = var.map["city"]
        Fruit1 = var.list[0]
        Fruit2 = var.list[1]
        Fruit3 = var.list[2]
    }
  
}