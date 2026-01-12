variable "sensitive-content" {
  sensitive = true
  default   = "password"
}

resource "local_file" "file" {
  content  = var.sensitive-content
  filename = "password.txt"
}

/*
resource "local_sensitive_file "file_sensitive"{
  content = "password"
  filename = "password.txt"
}
*/