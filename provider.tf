variable "vault_login" {}
variable "vault_password" {}
variable "vault_addr" {}

provider "vault" {
  address = var.vault_addr
  auth_login {
    path = "auth/userpass/login/${var.vault_login}"

    parameters = {
      password = var.vault_password
    }
  }
}

