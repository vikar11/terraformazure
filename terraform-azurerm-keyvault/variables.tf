variable "keyvault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "kv_sku" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = string
}

variable "access_policy" {
  description = <<EOF
  Access policy details:
  (Required) tenant_id - The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Must match the tenant_id used above.
  (Required) object_id - The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies.
  (Optional) application_id - The object ID of an Application in Azure Active Directory.
  (Optional) certificate_permissions - List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update.
  (Optional) key_permissions - List of key permissions. Possible values are Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy and SetRotationPolicy.
  (Optional) secret_permissions - List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set.
  (Optional) storage_permissions -  List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update.
  EOF
  type = list(object({
    tenant_id               = string
    object_id               = string
    application_id          = optional(string, null)
    certificate_permissions = optional(list(string), null)
    key_permissions         = optional(list(string), null)
    secret_permissions      = optional(list(string), null)
    storage_permissions     = optional(list(string), null)
  }))
  default = null
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_rbac_authorization" {
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
  type        = bool
  default     = false
}

variable "network_acls" {
  description = <<EOF
  Network acls details:
  (Required) bypass - Specifies which traffic can bypass the network rules. Possible values are AzureServices and None.
  (Required) default_action - The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny.
  (Optional) ip_rules - One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault.
  (Optional) virtual_network_subnet_ids - One or more Subnet IDs which should be able to access this Key Vault.
  EOF
  type = object({
    bypass                     = string
    default_action             = string
    ip_rules                   = optional(set(string), null)
    virtual_network_subnet_ids = optional(set(string), null)
  })
  default = null
}

variable "purge_protection_enabled" {
  description = "Purge Protection enabled for this Key Vault? Defaults to false."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault. Defaults to true."
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "This value can be between 7 and 90 (the default) days."
  }
  type    = number
  default = 7
}

variable "contact" {
  description = <<EOF
  Contact details:
  (Required) email - E-mail address of the contact.
  (Optional) name - Name of the contact.
  (Optional) phone - Phone number of the contact.
  EOF
  type = list(object({
    email = string
    name  = optional(string, null)
    phone = optional(string, null)
  }))
  default = null
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}
