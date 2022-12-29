variable "application" {
  description = "Application name"
  type = string
  default = ""
}

variable "vault_mount_accessor" {
  description = "External name accessor in vault. Example: oidc, github...,"
  type = string
  default = "auth_oidc_86ec3b1c"
}

variable "group_type" {
  description = "external or internal"
  type = string
  default = "external"
}

variable "squads" {
  description = "Squad name in organization"
  type = map(object({
    applications = optional(set(string))
    permissions  = optional(list(string))
    environment  = optional(set(string))
  }))
  default = {}
}

variable "secrets_path" {
  description = "Secrets path name"
  type = string
  default = "secret"
}