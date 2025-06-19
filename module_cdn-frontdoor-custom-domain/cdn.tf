resource "azurerm_cdn_frontdoor_custom_domain" "frontdoor_custom_domain" {
  name                     = var.frontdoor_custom_domain_name
  cdn_frontdoor_profile_id = var.cdn_frontdoor_profile_id
  dns_zone_id              = var.dns_zone_id
  host_name                = var.host_name
  tls {
    certificate_type        = var.tls_certificate_type
    minimum_tls_version     = var.tls_minimum_tls_version
    cdn_frontdoor_secret_id = var.tls_cdn_frontdoor_secret_id
  }
}