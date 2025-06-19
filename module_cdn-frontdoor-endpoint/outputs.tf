output "frontdoor_endpoint_id" {
  value       = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.id
  description = "The ID of this Front Door Endpoint."
}

output "frontdoor_endpoint_host_name" {
  value       = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.id
  description = "The host name of the Front Door Endpoint, in the format {endpointName}.{dnsZone} (for example, contoso.azureedge.net)."
}

