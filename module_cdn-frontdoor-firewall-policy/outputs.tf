output "frontdoor_firewall_policy_id" {
  value       = azurerm_cdn_frontdoor_firewall_policy.frontdoor_firewall_policy.id
  description = "The ID of the Front Door Firewall Policy."
}
/*
output "frontdoor_firewall_policy_location" {
  value       = azurerm_cdn_frontdoor_firewall_policy.frontdoor_firewall_policy.location
  description = "The Azure Region where this Front Door Firewall Policy exists."
}*/

output "frontdoor_firewall_policy_frontend_endpoint_ids" {
  value       = azurerm_cdn_frontdoor_firewall_policy.frontdoor_firewall_policy.frontend_endpoint_ids
  description = "The Front Door Profiles frontend endpoints associated with this Front Door Firewall Policy."
}