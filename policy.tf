
# Create vault policy, based in template file policy.tpl
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy

resource "vault_policy" "policy" {
  for_each = tomap(var.squads)
  name     = each.key

  policy = templatefile(
    "${path.module}/policy.tpl", {
      applications = each.value["applications"],
      permissions  = jsonencode(each.value["permissions"]),
      environment  = each.value["environment"],
      secrets      = jsonencode(var.secrets_path)
    }
  )
}

