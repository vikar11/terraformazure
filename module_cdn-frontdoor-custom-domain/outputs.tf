output "frontdoor_custom_domain_id" {
  value       = azurerm_cdn_frontdoor_custom_domain.frontdoor_custom_domain.id
  description = "The ID of the Front Door Custom Domain."
}

output "frontdoor_custom_domain_expiration_date" {
  value       = azurerm_cdn_frontdoor_custom_domain.frontdoor_custom_domain.expiration_date
  description = "The date time that the token expires."
}

output "frontdoor_custom_domain_validation_token" {
  value       = azurerm_cdn_frontdoor_custom_domain.frontdoor_custom_domain.validation_token
  description = "The date time that the token expires."
}
