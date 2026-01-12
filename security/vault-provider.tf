provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "demo" {
  path = "secret/data/demo"
}

output "demo_secret_value" {
  value     = data.vault_generic_secret.demo.data["data"]["value"]
  sensitive = true
}