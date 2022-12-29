variable "login_username" {}
variable "login_password" {}
variable "vault_addr" {}

provider "vault" {
  address = var.vault_addr
  auth_login {
    path = "auth/userpass/login/${var.login_username}"

    parameters = {
      password = var.login_password
    }
  }
}

