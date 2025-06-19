resource "azurerm_cdn_frontdoor_route" "frontdoor_route" {
  name                            = var.frontdoor_route_name
  cdn_frontdoor_endpoint_id       = var.cdn_frontdoor_endpoint_id
  cdn_frontdoor_origin_group_id   = var.cdn_frontdoor_origin_group_id
  cdn_frontdoor_origin_ids        = var.cdn_frontdoor_origin_ids
  cdn_frontdoor_custom_domain_ids = var.cdn_frontdoor_custom_domain_ids
  cdn_frontdoor_origin_path       = var.cdn_frontdoor_origin_path
  cdn_frontdoor_rule_set_ids      = var.cdn_frontdoor_rule_set_ids


  forwarding_protocol = var.forwarding_protocol
  patterns_to_match   = var.patterns_to_match
  supported_protocols = var.supported_protocols

  dynamic "cache" {
    for_each = var.query_string_caching_behavior != null || var.query_strings != null && var.compression_enabled != false || var.content_types_to_compress != null ? [1] : []
    content {
      query_string_caching_behavior = var.query_string_caching_behavior
      query_strings                 = var.query_strings
      compression_enabled           = var.compression_enabled
      content_types_to_compress     = var.content_types_to_compress
    }
  }
  enabled                = var.route_enabled
  https_redirect_enabled = var.https_redirect_enabled
  link_to_default_domain = var.link_to_default_domain


}