# the Ephemeral block defines resources that are essentially temporary
# use ephemeral instead of ressource to not show password in tfstate
# write-only argument = ephemeral
ephemeral "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!$~#|[}]@"
}

resource "aws_db_instance" "default" {
  allocated_storage   = 10
  db_name             = "db"
  engine              = "mysql"
  engine_version      = "9.0"
  instance_class      = "db.t3.micro"
  username            = "admin"
  password_wo         = ephemeral.random_password.db_password.result
  password_wo_version = 1
  skip_final_snapshot = true
}

output "db_password" {
  value     = aws_db_instance.default.password
  sensitive = true
}