resource "aws_iam_user" "lb" {
  name = "user_${count.index}"
  count = 3
  path = "/system/"
}

output "user_names_combined" {
  value = zipmap(
    aws_iam_user.lb.*.arn,
    aws_iam_user.lb.*.name
  )
}


#lifecycle approch
resource "aws_instance" "lifecycle" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t3.micro"
    tags = {
        Name = "lifecycle-example"
    }
    lifecycle {
        #we name it meta-argument => view doc for more details
        #if we add manually tag to the instance it will be ignored during next apply
        # but with the default behavior it will destroy the manual changes
        ignore_changes = [ tags ]
    }
}