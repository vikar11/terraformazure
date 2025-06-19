output "frontdoor_rule_set_id" {
  value       = azurerm_cdn_frontdoor_rule_set.frontdoor_rule_set.id
  description = "The ID of the Front Door Rule Set."
}