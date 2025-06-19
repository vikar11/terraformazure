output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

#--------------

output "container_registry_id" {
  description = "The ID of the Container Registry"
  value       = module.container_registry.id
}

output "container_registry_login_server" {
  description = "The URL that can be used to log into the container registry"
  value       = module.container_registry.login_server
}
