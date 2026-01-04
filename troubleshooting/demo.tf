# we will use terraform fmt to format this file
# terraform fmt -diff: shows the difference between before and after formatting
# terraform fmt -recursive : shows all files in the directory and subdirectories
# terraform fmt -check : checks if the file is formatted or not
#before formatting
resource "local_file" "demo" {
        content  = "demo"
  filename = "${path.module}/demo.log"
}

#after formatting
resource "local_file" "demo" {
  content  = "demo"
  filename = "${path.module}/demo.log"
}

