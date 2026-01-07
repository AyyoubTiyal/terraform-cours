variable "my-object" {
  type = object({
    name = string, 
    age  = number,
    tags = list(string) 
  })

  default = {
    name = "John Doe",
    age  = 30,
    tags = ["dev", "ops"]
  }
}

output "object-data" {
    value = var.my-object
}
