resource "azurerm_cdn_frontdoor_security_policy" "frontdoor_security_policy" {
  name                     = var.frontdoor_security_policy_name
  cdn_frontdoor_profile_id = var.cdn_frontdoor_profile_id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = var.cdn_frontdoor_firewall_policy_id

      association {
        domain {
          cdn_frontdoor_domain_id = var.cdn_frontdoor_domain_id
        }
        patterns_to_match = var.patterns_to_match
      }
    }
  }
}