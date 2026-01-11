resource "time_sleep" "wait_100_seconds" {
  create_duration = "100s"
}

# Terraform will create a file .lock to indicate that the state is locked
# and will be removed when the operation is finished
# This is useful when multiple users are working on the same state file
# to prevent concurrent operations that could corrupt the state file