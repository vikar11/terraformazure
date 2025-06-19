output "frontdoor_rule_id" {
  value       = azurerm_cdn_frontdoor_rule.frontdoor_rule.id
  description = " The ID of the Front Door Rule."
}

output "frontdoor_rule_cdn_frontdoor_rule_set_name" {
  value       = azurerm_cdn_frontdoor_rule.frontdoor_rule.name
  description = "The name of the Front Door Rule Set containing this Front Door Rule."
}