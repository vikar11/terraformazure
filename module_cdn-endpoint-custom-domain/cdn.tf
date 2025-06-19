resource "azurerm_cdn_endpoint_custom_domain" "endpoint_custom_domain" {
  name            = var.endpoint_custom_domain_name
  cdn_endpoint_id = var.cdn_endpoint_id
  host_name       = var.endpoint_custom_domain_host_name
  /*dynamic "cdn_managed_https" {
    for_each = var.cdn_managed_https_certificate_type != null && var.cdn_managed_https_protocol_type != null ? [1] : []
    content {
      certificate_type = var.cdn_managed_https_certificate_type
      protocol_type = var.cdn_managed_https_protocol_type
      tls_version = var.cdn_managed_https_tls_version
    }
  }*/
  dynamic "user_managed_https" {
    for_each = var.user_managed_https_key_vault_certificate_id != null || var.user_managed_https_key_vault_secret_id != null ? [1] : []
    content {
      key_vault_certificate_id = var.user_managed_https_key_vault_certificate_id
      //key_vault_secret_id = var.user_managed_https_key_vault_secret_id
      tls_version = var.user_managed_https_tls_version
    }
  }
}
