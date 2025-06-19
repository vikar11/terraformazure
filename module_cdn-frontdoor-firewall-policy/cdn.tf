resource "azurerm_cdn_frontdoor_firewall_policy" "frontdoor_firewall_policy" {
  name                = var.frontdoor_firewall_policy_name
  resource_group_name = var.resource_group_name
  sku_name            = var.frontdoor_firewall_policy_sku_name
  enabled             = var.frontdoor_firewall_policy_enabled
  mode                = var.frontdoor_firewall_policy_mode
  redirect_url        = var.redirect_url
  dynamic "custom_rule" {
    for_each = var.custom_rule_name != null && var.custom_rule_action != null && var.custom_rule_priority != null && var.custom_rule_type != null && var.custom_rule_match_condition_match_variable != null && var.custom_rule_match_condition_match_values != null && var.custom_rule_match_condition_operator != null ? [1] : []
    content {
      name     = var.custom_rule_name
      action   = var.custom_rule_action
      enabled  = var.custom_rule_enabled
      priority = var.custom_rule_priority
      type     = var.custom_rule_type
      dynamic "match_condition" {
        for_each = var.custom_rule_match_condition_match_variable != null && var.custom_rule_match_condition_match_values != null && var.custom_rule_match_condition_operator != null ? [1] : []
        content {
          match_variable     = var.custom_rule_match_condition_match_variable
          match_values       = var.custom_rule_match_condition_match_values
          operator           = var.custom_rule_match_condition_operator
          selector           = var.custom_rule_match_condition_selector
          negation_condition = var.custom_rule_match_condition_negation_condition
          transforms         = var.custom_rule_match_condition_transforms
        }
      }
      rate_limit_duration_in_minutes = var.custom_rule_rate_limit_duration_in_minutes
      rate_limit_threshold           = var.custom_rule_rate_limit_threshold
    }
  }
  custom_block_response_status_code = var.custom_block_response_status_code
  custom_block_response_body        = var.custom_block_response_body
  dynamic "managed_rule" {
    for_each = var.managed_rule_type != null && var.managed_rule_version != null && var.managed_rule_action != null ? [1] : []
    content {
      type    = var.managed_rule_type
      version = var.managed_rule_version
      action  = var.managed_rule_action
      dynamic "exclusion" {
        for_each = var.exclusion_match_variable != null && var.exclusion_operator != null && var.exclusion_selector != null ? [1] : []
        content {
          match_variable = var.exclusion_match_variable
          operator       = var.exclusion_operator
          selector       = var.exclusion_selector
        }
      }
      dynamic "override" {
        for_each = var.managed_rule_override_rule_group_name != null ? [1] : []
        content {
          rule_group_name = var.managed_rule_override_rule_group_name
          dynamic "exclusion" {
            for_each = var.exclusion_match_variable != null && var.exclusion_operator != null && var.exclusion_selector != null ? [1] : []
            content {
              match_variable = var.exclusion_match_variable
              operator       = var.exclusion_operator
              selector       = var.exclusion_selector
            }
          }
          dynamic "rule" {
            for_each = var.managed_rule_override_rule_rule_id != null && var.managed_rule_override_rule_action != null ? [1] : []
            content {
              rule_id = var.managed_rule_override_rule_rule_id
              action  = var.managed_rule_override_rule_action
              enabled = var.managed_rule_override_rule_enabled
              dynamic "exclusion" {
                for_each = var.exclusion_match_variable != null && var.exclusion_operator != null && var.exclusion_selector != null ? [1] : []
                content {
                  match_variable = var.exclusion_match_variable
                  operator       = var.exclusion_operator
                  selector       = var.exclusion_selector
                }
              }
            }
          }
        }
      }
    }
  }
  tags = var.frontdoor_firewall_policy_tags
}