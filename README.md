# vault-policy

## Getting started

### Example
To add a new policy or update existing policy, edit the <b>vars/policies.tfvars</b> file.

```
#Create configserver policy
squads  = {
  squad_name = { 
    az_group_object_id = "fbdse2e13-f974-4s27-ab94-64c65817sas01"
    applications       = [ "servico-diploma-consumidores", "etl-dados-corporativos" ]
    permissions        = ["read", "list", "update"]
    environment        = ["development", "producao", "homologacao" ]
  },
#Create standard policy permission all security KV
  security = {
    az_group_object_id = "46855101-ff39-4624-ab6c-5f372ffa7a70"
    applications       = ["*"]
    permissions        = ["create", "read", "update", "patch", "delete", "list"]
    kv_configserver    = false
    kv_path            = "security"
  },   
}
```  

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

#### Capabilities
Each path must define one or more capabilities which provide fine-grained control over permitted (or denied) operations. As shown in the examples above, capabilities are always specified as a list of strings, even if there is only one capability.

To determine the capabilities needed to perform a specific operation, the -output-policy flag can be added to the CLI subcommand. For an example, refer to the Print Policy Requirements document section.

The list of capabilities include the following:

<b>create</b> (POST/PUT) - Allows creating data at the given path. Very few parts of Vault distinguish between create and update, so most operations require both create and update capabilities. Parts of Vault that provide such a distinction are noted in documentation.

<b>read</b> (GET) - Allows reading the data at the given path.

<b>update</b> (POST/PUT) - Allows changing the data at the given path. In most parts of Vault, this implicitly includes the ability to create the initial value at the path.

<b>patch</b> (PATCH) - Allows partial updates to the data at a given path.

<b>delete</b> (DELETE) - Allows deleting the data at the given path.

<b>list</b> (LIST) - Allows listing values at the given path. Note that the keys returned by a list operation are not filtered by policies. Do not encode sensitive information in key names. Not all backends support listing.

In the list above, the associated HTTP verbs are shown in parenthesis next to the capability. When authoring policy, it is usually helpful to look at the HTTP API documentation for the paths and HTTP verbs and map them back onto capabilities. While the mapping is not strictly 1:1, they are often very similarly matched.

In addition to the standard set, there are some capabilities that do not map to HTTP verbs.

<b>sudo</b> - Allows access to paths that are root-protected. Tokens are not permitted to interact with these paths unless they have the sudo capability (in addition to the other necessary capabilities for performing an operation against that path, such as read or delete).

For example, modifying the audit log backends requires a token with sudo privileges.

<b>deny</b> - Disallows access. This always takes precedence regardless of any other defined capabilities, including sudo.