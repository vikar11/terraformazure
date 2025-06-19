resource "azurerm_container_registry" "container_registry" {
  name                = var.registery_name
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_enabled       = var.admin_enabled
  sku                 = var.sku
  tags                = var.tags
  dynamic "georeplications" {
    for_each = var.sku == "Basic" && var.georeplications != null ? var.georeplications : []
    content {
      location                  = georeplications.value.location
      zone_redundancy_enabled   = georeplications.value.zone_redundancy_enabled 
      regional_endpoint_enabled = georeplications.value.regional_endpoint_enabled
      tags                      = georeplications.value.tags
    }
  }
  dynamic "network_rule_set" {
    for_each = var.sku == "Basic" && var.network_rule_set != null ? [var.network_rule_set] : []
    content {
      default_action = network_rule_set.value.default_action
      dynamic "ip_rule" {
        for_each = network_rule_set.value.ip_rule
        content {
          action   = ip_rule.value.action
          ip_range = ip_rule.value.ip_range
        }
      }
    }
  }
  public_network_access_enabled = var.public_network_access_enabled
  quarantine_policy_enabled     = var.sku == "Basic" && var.quarantine_policy_enabled != false ? var.quarantine_policy_enabled : false
  dynamic "retention_policy" {
    for_each = var.sku == "Premium" && var.retention_policy != null ? [var.retention_policy] : []
    content {
      days    = retention_policy.value.days
      enabled = retention_policy.value.enabled
    }
  }
  #This is not supported for encryption enabled registries .
  #To enable content trust first disable the encryption
  dynamic "trust_policy" {
    for_each = var.sku == "Basic" && var.enable_content_trust ? [1] : []
    content {
      enabled = var.enable_content_trust
    }
  }
  zone_redundancy_enabled = var.sku == "Basic" && var.zone_redundancy_enabled != false ? var.zone_redundancy_enabled : false
  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.identity_type
      identity_ids = identity.value.identity_type != "SystemAssigned" ? identity.value.identity_ids : null
    }
  }
  export_policy_enabled = var.sku == "Basic" && var.export_policy_enabled != false ? var.export_policy_enabled : false
  dynamic "encryption" {
    for_each = var.encryption != null ? [var.encryption] : []
    content {
      #enabled            = encryption.value.enabled
      key_vault_key_id   = encryption.value.key_vault_key_id
      identity_client_id = encryption.value.identity_client_id
    }
  }
  anonymous_pull_enabled     = (var.sku == "Standard" || var.sku == "Basic") && var.anonymous_pull_enabled  != false ? var.anonymous_pull_enabled  : false
  data_endpoint_enabled      = var.sku == "Basic" && var.data_endpoint_enabled != false ? var.data_endpoint_enabled : false
  network_rule_bypass_option = var.network_rule_bypass_option
}
#----------------------------------------------------------
# Container Registry  Agent pool 
#--------------------------------------------------------
resource "azurerm_container_registry_agent_pool" "agent_pool" {
  for_each                  = var.agent_pool != null ? var.agent_pool : {}
  name                      = each.value.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  container_registry_name   = azurerm_container_registry.container_registry.name
  instance_count            = each.value.instance_count
  tier                      = each.value.tier
  virtual_network_subnet_id = each.value.virtual_network_subnet_id
  tags                      = each.value.tags
}
#------------------------------------------------------------
# Container Registry Resoruce Scope map - Default is "false"
#------------------------------------------------------------
resource "azurerm_container_registry_scope_map" "scope_map" {
  for_each                = var.scope_map != null ? var.scope_map : {}
  name                    = each.value.name
  resource_group_name     = var.resource_group_name
  container_registry_name = azurerm_container_registry.container_registry.name
  actions                 = each.value.actions
  description             = each.value.description
}
#------------------------------------------------------------
# Container Registry Token  - Default is "false"
#------------------------------------------------------------
resource "azurerm_container_registry_token" "registry_token" {
  for_each                = var.scope_map != null && var.registry_token != null ? var.registry_token : {}
  name                    = each.value.name
  resource_group_name     = var.resource_group_name
  container_registry_name = azurerm_container_registry.container_registry.name
  scope_map_id            = element([for k in azurerm_container_registry_scope_map.scope_map : k.id], 0)
  enabled                 = each.value.enabled
}
#------------------------------------------------------------
# Container Registry webhook - Default is "true"
#------------------------------------------------------------
resource "azurerm_container_registry_webhook" "registry_webhook" {
  for_each            = var.container_registry_webhooks != null ? var.container_registry_webhooks : {}
  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  registry_name       = azurerm_container_registry.container_registry.name
  service_uri         = each.value.service_uri
  actions             = each.value.actions
  status              = each.value.status
  scope               = each.value.scope
  custom_headers      = each.value.custom_headers
  tags                = each.value.tags
}