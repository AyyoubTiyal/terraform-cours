
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

        # create a new resource before destroying the old one, if we change some attribute
        create_before_destroy = true

        # prevent destroy of the resource, can be used for critical resources, to avoid accidental deletion
        prevent_destroy = true
    }
}