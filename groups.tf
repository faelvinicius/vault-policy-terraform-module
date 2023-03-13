# A group can contain multiple entities as its members. A group can also have subgroups.
# Policies set on the group is granted to all members of the group. 
# During request time, when the token's entity ID is being evaluated for the policies that it has access to; along with the policies on the entity itself, policies that are inherited due to group memberships are also granted
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group
resource "vault_identity_group" "group" {
  for_each = tomap(var.squads)
  
  name     = each.key
  type     = var.group_type
  policies = [vault_policy.policy[each.key].name]
}

# Group aliases allows entity membership in external groups to be managed semi-automatically. External group serves as a mapping to a group that is outside of the identity store.
# External groups can have one (and only one) alias. This alias should map to a notion of group that is outside of the identity store.
# For example, groups in LDAP, and teams in GitHub. A username in LDAP, belonging to a group in LDAP, can get its entity ID added as a member of a group in Vault automatically during logins and token renewals.
# This works only if the group in Vault is an external group and has an alias that maps to the group in LDAP. If the user is removed from the group in LDAP, that change gets reflected in Vault only upon the subsequent login or renewal operation.
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_alias
resource "vault_identity_group_alias" "group-alias" {
  for_each = tomap(var.squads)
  
  name           = each.value["az_group_object_id"]
  mount_accessor = var.vault_mount_accessor
  canonical_id   = vault_identity_group.group[each.key].id
}

