
# Create vault policy, based in template file policy.tpl
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy

resource "vault_policy" "kv_configserver_policy" {
  for_each = { for k, v in tomap(var.squads) :
    k => v if try(v["kv_configserver"], false) == true
  }

  #for_each = tomap(var.squads)
 
  name     = each.key
  policy = templatefile(
    "${path.module}/kv_configserver_policy.tpl", {
      applications = each.value["applications"],
      permissions  = jsonencode(each.value["permissions"]),
      environment  = each.value["environment"],
      kv_path      = each.value["kv_path"],
    }
  )
}

resource "vault_policy" "kv_standard_policy" {
  for_each = { for k, v in tomap(var.squads) :
    k => v if try(v["kv_configserver"], true) == false
  }

  #for_each = tomap(var.squads)
 
  name     = each.key
  policy = templatefile(
    "${path.module}/kv_standard_policy.tpl", {
      applications = each.value["applications"],
      permissions  = jsonencode(each.value["permissions"]),
      kv_path      = each.value["kv_path"],
    }
  )
}

