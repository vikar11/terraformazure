output "id" {
  description = "The ID of the Container Registry"
  value       = azurerm_container_registry.container_registry.id
}

output "login_server" {
  description = "The URL that can be used to log into the container registry"
  value       = azurerm_container_registry.container_registry.login_server
}

output "scope_map_id" {
  description = "The ID of the Container Registry scope map"
  value       = var.scope_map != null ? [for k in azurerm_container_registry_scope_map.scope_map : k.id] : null
}

output "webhook_id" {
  description = "The ID of the Container Registry Webhook"
  value       = var.container_registry_webhooks != null ? [for k in azurerm_container_registry_webhook.registry_webhook : k.id] : null
}

