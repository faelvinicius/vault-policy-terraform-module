## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group.group](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_alias.group-alias](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_alias) | resource |
| [vault_policy.policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application name | `string` | `""` | no |
| <a name="input_group_type"></a> [group\_type](#input\_group\_type) | external or internal | `string` | `"external"` | no |
| <a name="input_kv_path"></a> [kv\_path](#input\_kv\_path) | kv path name | `string` | `"secret"` | no |
| <a name="input_squads"></a> [squads](#input\_squads) | Squad name in organization | <pre>map(object({<br>    applications       = optional(set(string))<br>    permissions        = optional(list(string))<br>    environment        = optional(set(string))<br>    az_group_object_id = optional(string)<br>    kv_path            = optional(string, "secret")<br>    kv_configserver    = optional(bool, true)<br>  }))</pre> | `{}` | no |
| <a name="input_vault_addr"></a> [vault\_addr](#input\_vault\_addr) | n/a | `any` | n/a | yes |
| <a name="input_vault_login"></a> [vault\_login](#input\_vault\_login) | n/a | `any` | n/a | yes |
| <a name="input_vault_mount_accessor"></a> [vault\_mount\_accessor](#input\_vault\_mount\_accessor) | External name accessor in vault. Example: oidc, github..., | `string` | `"auth_oidc_86ec3b1c"` | no |
| <a name="input_vault_password"></a> [vault\_password](#input\_vault\_password) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
