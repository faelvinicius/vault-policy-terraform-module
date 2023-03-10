path "${kv_path}/*" {
  capabilities = ["list"]
}
%{ for env in environment ~} 
%{ for app in applications ~}  
path "${kv_path}/data/${app},${env}" { 
  capabilities = ${permissions}
}
%{ endfor ~}
%{ endfor ~}