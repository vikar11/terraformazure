resource "azurerm_cdn_frontdoor_route_disable_link_to_default_domain" "frontdoor_route_disable_link_to_default_domain" {
  cdn_frontdoor_route_id          = var.cdn_frontdoor_route_id
  cdn_frontdoor_custom_domain_ids = var.cdn_frontdoor_custom_domain_ids
}