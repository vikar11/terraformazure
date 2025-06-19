## CDN Frontdoor Profile
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of RG"
}

variable "frontdoor_profile_name" {
  type        = string
  description = "Specifies the name of the CDN Frotndoor Profile"
}

variable "frontdoor_profile_sku_name" {
  type        = string
  description = "The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}

variable "frontdoor_profile_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the CDN Frotndoor Profile"
}

#keyvault
variable "keyvault_name" {
  type        = string
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
}

# variable "tenant_id" {
#   type        = string
#   description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
# }

variable "kv_sku" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Purge Protection enabled for this Key Vault? Defaults to false."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this Key Vault. Defaults to true."
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
}

variable "default_action" {
  type        = string
  description = " The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}

variable "bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None"
}

variable "ip_rules" {
  type        = list(string)
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "One or more Subnet IDs which should be able to access this Key Vault."
}

variable "contact_email" {
  type        = string
  description = "E-mail address of the contact."
}

variable "contact_name" {
  type        = string
  description = "Name of the contact."
}

variable "contact_phone" {
  type        = string
  description = "Phone number of the contact."
}

variable "keyvault_tags" {
  type        = map(string)
  description = "The tags to associate with your network and subnets."
}

variable "enable_access_policy" {
  type        = bool
  description = "Want to add access policy?"
}

# variable "object_id" {
#   type        = string
#   description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
# }

variable "application_id" {
  type        = string
  description = "The object ID of an Application in Azure Active Directory."
}

variable "keyvault_key_permissions" {
  type        = list(string)
  description = " List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy."
}

variable "keyvault_secret_permissions" {
  type        = list(string)
  description = " List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "keyvault_certificate_permissions" {
  type        = list(string)
  description = " List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}

variable "keyvault_storage_permissions" {
  type        = list(string)
  description = " List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
}

#keyvault access policy - both
variable "application_id1" {
  type        = string
  description = "The object ID of an Application in Azure Active Directory."
}

variable "key_permissions1" {
  type        = list(string)
  default     = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
  description = " List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy."
}

variable "secret_permissions1" {
  type        = list(string)
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
  description = " List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "certificate_permissions1" {
  type        = list(string)
  default     = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
  description = " List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}

variable "storage_permissions1" {
  type        = list(string)
  default     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
  description = " List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
}

#keyvault certificate
variable "keyvault_certificate" {
  type        = string
  description = "Specifies the name of the Key Vault Certificate."
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the Key Vault where the Certificate should be created."
}

variable "generate_certificate" {
  type        = bool
  description = "Wants to generate a certificate?"
}

variable "certificate" {
  type = object({
    //contents = string
    password = string
  })
  description = "contents - (Required) The base64-encoded certificate contents. password - (Optional) The password associated with the certificate. Changing this forces a new resource to be created."
}

variable "certificate_policy" {
  type = list(object({
    issuer_parameters_name = string
    curve                  = string
    exportable             = string
    key_size               = string
    key_type               = string
    reuse_key              = string
    content_type           = string
    lifetime_action = list(object({
      action_type         = string
      days_before_expiry  = string
      lifetime_percentage = number
    }))
    x509_certificate_properties = list(object({
      extended_key_usage = list(string)
      key_usage          = list(string)
      subject            = string
      validity_in_months = string
      subject_alternative_names = list(object({
        dns_names = list(string)
        emails    = list(string)
        upns      = list(string)
      }))
    }))
  }))
  description = "issuer_parameters:name - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). key_properties: curve - (Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. exportable - (Required) Is this certificate exportable? Changing this forces a new resource to be created. key_size - (Optional) The size of the key used in the certificate. Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys. This property is required when using RSA keys. key_type - (Required) Specifies the type of key, such as RSA or EC. reuse_key - (Required) Is the key reusable? lifetime_action: action_type - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. days_before_expiry - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. lifetime_percentage - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run.  "
}

variable "certificate_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}


/*
#--------------------------------------VARIABLES: RESOURCE: KEYVAULT-----------------------------------#
variable "keyvault_name" {
  type        = string
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "tenant_id" {
   type        = string
   description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "kv_sku" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Purge Protection enabled for this Key Vault? Defaults to false."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this Key Vault. Defaults to true."
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
}

variable "default_action" {
  type        = string
  description = " The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}

variable "bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None"
}

variable "ip_rules" {
  type        = list(string)
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "One or more Subnet IDs which should be able to access this Key Vault."
}

variable "contact_email" {
  type        = string
  description = "E-mail address of the contact."
}

variable "contact_name" {
  type        = string
  description = "Name of the contact."
}

variable "contact_phone" {
  type        = string
  description = "Phone number of the contact."
}

variable "keyvault_tags" {
  type        = map(string)
  description = "The tags to associate with your network and subnets."
}

#------------------------------------VARIABLES: RESOURCE: KEYVAULT ACCESS POLICY--------------------------------#
variable "enable_access_policy" {
  type        = bool
  description = "Want to add access policy?"
}

variable "object_id" {
   type        = string
   description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
}

variable "application_id" {
  type        = string
  description = "The object ID of an Application in Azure Active Directory."
}

variable "keyvault_key_permissions" {
  type        = list(string)
  description = " List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy."
}

variable "keyvault_secret_permissions" {
  type        = list(string)
  description = " List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "keyvault_certificate_permissions" {
  type        = list(string)
  description = " List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}

variable "keyvault_storage_permissions" {
  type        = list(string)
  description = " List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
}

#KEY VAULT CERT
variable "keyvault_certificate" {
  type        = string
  description = "Specifies the name of the Key Vault Certificate."
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the Key Vault where the Certificate should be created."
}

variable "generate_certificate" {
  type        = bool
  description = "Wants to generate a certificate?"
}

variable "certificate" {
  type = object({
    //contents = string
    password = string
  })
  description = "contents - (Required) The base64-encoded certificate contents. password - (Optional) The password associated with the certificate. Changing this forces a new resource to be created."
}

variable "certificate_policy" {
  type = list(object({
    issuer_parameters_name = string
    curve                  = string
    exportable             = string
    key_size               = string
    key_type               = string
    reuse_key              = string
    content_type           = string
    lifetime_action = list(object({
      action_type         = string
      days_before_expiry  = string
      lifetime_percentage = number
    }))
    x509_certificate_properties = list(object({
      extended_key_usage = list(string)
      key_usage          = list(string)
      subject            = string
      validity_in_months = string
      subject_alternative_names = list(object({
        dns_names = list(string)
        emails    = list(string)
        upns      = list(string)
      }))
    }))
  }))
  description = "issuer_parameters:name - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). key_properties: curve - (Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. exportable - (Required) Is this certificate exportable? Changing this forces a new resource to be created. key_size - (Optional) The size of the key used in the certificate. Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys. This property is required when using RSA keys. key_type - (Required) Specifies the type of key, such as RSA or EC. reuse_key - (Required) Is the key reusable? lifetime_action: action_type - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. days_before_expiry - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. lifetime_percentage - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run.  "
}

variable "keyvault_certificate_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}
*/
#--------------------------------------VARIABLES: RESOURCE: CDN FRONTDOOR SECRET-----------------------------------#
variable "frontdoor_secret_name" {
  type        = string
  description = "The name which should be used for this Front Door Secret. Possible values must start with a letter or a number, only contain letters, numbers and hyphens and have a length of between 2 and 260 characters. Changing this forces a new Front Door Secret to be created"
}

variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The Resource ID of the Front Door Profile. Changing this forces a new Front Door Secret to be created."
}

variable "key_vault_certificate_id" {
  type        = string
  description = "The ID of the Key Vault certificate resource to use. Changing this forces a new Front Door Secret to be created."
}

variable "key_vault_resource_group_name" {
  type        = string
  description = "rg of key vault"
}

variable "service_principal_object_id" {
  type = string
  description = "SP Object id"
}