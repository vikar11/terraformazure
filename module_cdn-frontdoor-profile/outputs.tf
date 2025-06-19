output "frontdoor_profile_id" {
  value       = azurerm_cdn_frontdoor_profile.frontdoor_profile.id
  description = "The ID of this Front Door Profile."
}

output "frontdoor_profile_resource_guid" {
  value       = azurerm_cdn_frontdoor_profile.frontdoor_profile.resource_guid
  description = "The UUID of this Front Door Profile which will be sent in the HTTP Header as the X-Azure-FDID attribute."
}

// output "frontdoor_id" {
//   value = azurerm_cdn_frontdoor_profile.frontdoor_profile.id
// }
