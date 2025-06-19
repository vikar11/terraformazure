variable "registery_name" {
  description = "Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "sku" {
  description = "The SKU name of the the container registry. Possible values are Basic, Standard, Premium."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "georeplications" {
  description = <<EOF
  georeplications:
  (Required) location - A location where the container registry should be geo-replicated.
  (Optional) zone_redundancy_enabled -  Whether zone redundancy is enabled for this replication location? Defaults to false.
  (Optional) regional_endpoint_enabled - Whether regional endpoint is enabled for this Container Registry?
  (Required) tags - A mapping of tags to assign to this replication location.
  EOF
  type = list(object({
    location                  = string
    zone_redundancy_enabled   = optional(bool, false)
    regional_endpoint_enabled = optional(bool)
    tags                      = map(string)
  }))
  default = []
}

variable "network_rule_set" {
  description = <<EOF
  network_rule_set:
  (Optional) default_action - The default action of allow or deny when no other rules match. Defaults to Allow.
  (Optional) ip_rule - A list of IP rules to add to the network rule set.
  (Required) ip_range - A list of virtual network rules to add to the network rule set.
  (Required) action - The action of the rule. Defaults to Allow.
  EOF
  type = object({
    default_action = optional(string, "Allow")
    ip_rule = optional(list(object({
      ip_range = string
      action   = string
    })))
  })
  default = null
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the container registry. Defaults to true."
  type        = bool
  default     = true
}

variable "quarantine_policy_enabled" {
  description = "Whether to enable the quarantine policy for the container registry. Defaults to false."
  type        = bool
  default     = false
}

variable "retention_policy" {
  description = <<EOF
  retention_policy:
  (Optional) days - The number of days to retain an untagged manifest after which it gets purged. Defaults to 7.
  (Optional) enabled - Whether the retention policy is enabled.
  EOF
  type = object({
    days    = optional(number, 7)
    enabled = optional(bool)
  })
  default = null
}

variable "enable_content_trust" {
  description = "Boolean value to enable or disable Content trust in Azure Container Registry"
  type        = bool
  default     = false
}

variable "zone_redundancy_enabled" {
  description = "Whether to enable zone redundancy for the container registry. Defaults to false."
  type        = bool
  default     = false
}

variable "identity" {
  description = <<EOF
  identity:
  (Required) identity_type - Specifies the type of Managed Service Identity that should be configured on this Container Registry. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
  (Optional) identity_ids - Specifies a list of User Assigned Managed Identity IDs to be assigned to this Container Registry.
  Note: when UserAssigned identity is used, the identity_ids should not be empty.
  EOF
  type = object({
    identity_type = string
    identity_ids  = optional(list(string))
  })
  default = null
}

variable "export_policy_enabled" {
  description = "Whether to enable the export policy for the container registry. Defaults to true."
  type        = bool
  default     = true
}

variable "encryption" {
  description = <<EOF
  encryption:
  (Optional) enabled - Whether encryption is enabled for this container registry.
  (Required) key_vault_key_id - The Key Vault Key Id to be used for encryption.
  (Required) identity_client_id - The Client Id of the Managed Identity to be used for encryption.
  EOF
  type = object({
    enabled            = optional(bool)
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}

variable "anonymous_pull_enabled" {
  description = "Whether to allow anonymous pull for the container registry. Defaults to false."
  type        = bool
  default     = false
}

variable "data_endpoint_enabled" {
  description = "Whether to enable the data endpoint for the container registry. Defaults to false."
  type        = bool
  default     = false
}

variable "network_rule_bypass_option" {
  description = "The network rule bypass options for the container registry. Possible values are AzureServices, None. Defaults to AzureServices."
  type        = string
  default     = "AzureServices"
}


###############################################################################
variable "agent_pool" {
  description = <<EOF
  agent_pool:
  (Required) name - The name which should be used for this Azure Container Registry Agent Pool. Changing this forces a new Azure Container Registry Agent Pool to be created.
  (Optional) instance_count - The number of agents to be provisioned in the agent pool. Defaults to 1.
  (Optional) tier - Sets the VM your agent pool will run on. Valid values are: S1 (2 vCPUs, 3 GiB RAM), S2 (4 vCPUs, 8 GiB RAM), S3 (8 vCPUs, 16 GiB RAM) or I6 (64 vCPUs, 216 GiB RAM, Isolated). Defaults to S1. Changing this forces a new Azure Container Registry Agent Pool to be created.
  (Optional) virtual_network_subnet_id - The ID of the Virtual Network Subnet Resource where the agent machines will be running. Changing this forces a new Azure Container Registry Agent Pool to be created.
  (Required) tags - A mapping of tags which should be assigned to the Azure Container Registry Agent Pool.
  EOF
  type = map(object({
    name                      = string
    instance_count            = optional(number, 1)
    tier                      = optional(string)
    virtual_network_subnet_id = optional(string)
    tags                      = map(string)
  }))
  default = null
}
###############################################################################
variable "scope_map" {
  description = <<EOF
  scope_map:
  (Required) name - Specifies the name of the scope map. Changing this forces a new resource to be created.
  (Required) actions - A list of actions to attach to the scope map (e.g. repo/content/read, repo2/content/delete)
  (Optional) description - A description for the scope map.
  EOF
  type = map(object({
    name        = string
    actions     = list(string)
    description = optional(string)
  }))
  default = null
}
##############################################################################
variable "registry_token" {
  description = <<EOF
  registry_token:
  (Required) name - Specifies the name of the token. Changing this forces a new resource to be created.
  (Optional) enabled - Whether the token is enabled. Defaults to true.
  EOF
  type = map(object({
    name    = string
    enabled = optional(bool, true)
  }))
  default = null
}
##############################################################################
variable "container_registry_webhooks" {
  description = <<EOF
  container_registry_webhooks:
  (Required) name - Specifies the name of the Container Registry Webhook. Only Alphanumeric characters allowed. Changing this forces a new resource to be created.
  (Required) service_uri - Specifies the service URI for the Webhook to post notifications.
  (Required) actions -  A list of actions that trigger the Webhook to post notifications. At least one action needs to be specified. Valid values are: push, delete, quarantine, chart_push, chart_delete
  (Optional) status - Specifies if this Webhook triggers notifications or not. Valid values: enabled and disabled. Default is enabled.
  (Optional) scope - Specifies the scope of repositories that can trigger an event. For example, foo:* means events for all tags under repository foo. foo:bar means events for 'foo:bar' only. foo is equivalent to foo:latest. Empty means all events. Defaults to "".
  (Optional) custom_headers - Custom headers that will be added to the webhook notifications request.
  (Required) tags - A mapping of tags to assign to the resource.
  EOF
  type = map(object({
    name           = string
    service_uri    = string
    actions        = list(string)
    status         = optional(string)
    scope          = optional(string)
    custom_headers = optional(map(string))
    tags           = map(string)
  }))
  default = null
}
