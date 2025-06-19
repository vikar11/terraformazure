//Keyvault
output "keyvault_name" {
  value       = azurerm_key_vault.keyvault.name
  description = "The name of the keyvault"
}

output "keyvault_id" {
  value       = azurerm_key_vault.keyvault.id
  description = "The ID of the Key Vault."
}

output "keyvault_uri" {
  value       = azurerm_key_vault.keyvault.vault_uri
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
}

output "keyvault_tenant_id" {
  value       = azurerm_key_vault.keyvault.tenant_id
  description = "Keyvault Tenant Id"
}

//Keyvault Access Policy
output "keyvault_access_policy" {
  value       = azurerm_key_vault.keyvault.access_policy
  description = "keyvault_access_policy"
}

