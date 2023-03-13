path "${kv_path}/*" {
  capabilities = ["list"]
}
%{ for app in applications ~}  
path "${kv_path}/data/${app}" { 
  capabilities = ${permissions}
}
%{ endfor ~}
