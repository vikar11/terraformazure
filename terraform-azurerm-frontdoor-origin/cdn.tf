resource "azurerm_cdn_frontdoor_origin" "frontdoor_origin" {
  name                           = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id  = var.cdn_frontdoor_origin_group_id
  host_name                      = var.host_name
  certificate_name_check_enabled = var.certificate_name_check_enabled
  enabled                        = var.cdn_frontdoor_origin_enabled
  http_port                      = var.http_port
  https_port                     = var.https_port
  origin_host_header             = var.origin_host_header
  priority                       = var.priority
  dynamic "private_link" {
    for_each = var.private_link_location != null && var.private_link_private_link_target_id != null ? [1] : []
    content {
      request_message        = var.private_link_request_message
      target_type            = var.private_link_target_type
      location               = var.private_link_location
      private_link_target_id = var.private_link_private_link_target_id
    }
  }
  weight = var.weight
}