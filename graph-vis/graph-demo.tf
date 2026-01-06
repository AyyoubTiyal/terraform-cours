resource "aws_iam_user" "user" { 
    name = "user.${count.index}"
    count=3
    path = "/system/"
}

resource "aws_iam_user_policy" "user_policy" {
  count = 3
  user  = aws_iam_user.user[count.index].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:ListBucket"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_instance" "ec2" {
    ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID
    instance_type = "t2.micro"
    count         = 3
    
    tags = {
        Name = "ec2-instance-${count.index}"
    }
}


#In the terminal to visualize the resource graph, run:
# terraform graph -type=plan | dot -Tsvg > graph.svg


#to save the plan output to a file, run:
# terraform plan -out tfplan.plan
#and then run : terraform apply tfplan.plan
#to read the plan from the file. run :
# terraform show -json tfplan.plan