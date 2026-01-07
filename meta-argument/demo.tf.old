
#lifecycle approch
resource "aws_instance" "lifecycle" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  # use the meta_argument depends_on to create resource in order 's3 bucket first then instance"
  # when we use destroy command it will delete in reverse order instance first then s3 bucket
  depends_on = [aws_s3_bucket.s3_bucket]

  tags = {
    Name = "lifecycle-example"
  }
  lifecycle {
    #we name it meta-argument => view doc for more details

    #if we add manually tag to the instance it will be ignored during next apply
    # but with the default behavior it will destroy the manual changes
    ignore_changes = [tags] # 'all' => the changes made outside terraform will be ignored

    # create a new resource before destroying the old one, if we change some attribute
    create_before_destroy = true

    # prevent destroy of the resource, can be used for critical resources, to avoid accidental deletion
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "mybucket"
}

variable "iam_names" {

  type    = list(any)
  default = ["admin", "developer", "tester", "manager"]
}

resource "aws_iam_user" "users" {
  name  = var.iam_names[count.index]
  count = 3
  path  = "/"

  #the perfect solution is to use for_each
  # for_each = toset(var.iam_names)
}