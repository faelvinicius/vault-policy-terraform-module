path "secret/*" {
  capabilities = ["list"]
}
%{ for env in environment ~} 
%{ for app in applications ~}  
path "secret/data/${app},${env}" { 
  capabilities = ${permissions}
}
%{ endfor ~}
%{ endfor ~}