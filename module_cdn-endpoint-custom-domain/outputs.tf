output "endpoint_custom_domain_id"{
    value = azurerm_cdn_endpoint_custom_domain.endpoint_custom_domain.id
    description = " The ID of the CDN Endpoint Custom Domain."
}