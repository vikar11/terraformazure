resource "azurerm_cdn_frontdoor_endpoint" "frontdoor_endpoint" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = var.cdn_frontdoor_profile_id
  enabled                  = var.endpoint_enabled
  tags                     = var.frontdoor_endpoint_tags
}