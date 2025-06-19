##Storage Account
variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "storage_account_tier" {
  type        = string
  description = "STG ACC tier"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replication type of the storage account"
}

variable "storage_account_min_tls_version" {
  type = string
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2."
  default = "TLS1_2"
}

variable "storage_account_queue_logging_delete" {
  type = bool
  description = "Indicates whether all delete requests should be logged."
}

variable "storage_account_queue_logging_read" {
  type = bool
  description = "Indicates whether all read requests should be logged."
}

variable "storage_account_queue_logging_version" {
  type = bool
  description = "The version of storage analytics to configure."
}

variable "storage_account_queue_logging_write" {
  type = bool
  description = "Indicates whether all write requests should be logged."
}

## CDN Profile
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "profile_name" {
  type        = string
  description = "Specifies the name of the CDN Profile"
}

variable "sku" {
  type        = string
  description = "The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}

variable "profile_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the CDN Profile"
}

## CDN Endpoint
variable "endpoint_name" {
  type        = string
  description = " Specifies the name of the CDN Endpoint"
}

variable "is_http_allowed" {
  type        = bool
  description = "Is http traffic enabled on the endpoint"
  default     = true
}

variable "is_https_allowed" {
  type        = bool
  description = "Is https traffic enabled on the endpoint"
  default     = true
}

variable "content_types_to_compress" {
  type        = list(string)
  description = " An array of strings that indicates a content types on which compression will be applied. The value for the elements should be MIME types."
  default     = null
}

variable "geo_filter_config" {
  type = object({
    relative_path = string
    action        = string
    country_codes = list(string)
  })
  description = "A set of Geo Filters for this CDN Endpoint"
}

variable "is_compression_enabled" {
  type        = bool
  description = "Indicates whether compression is to be enabled"
  default     = false
}

variable "querystring_caching_behaviour" {
  type        = string
  description = "Sets query string caching behavior. Allowed values are IgnoreQueryString, BypassCaching and UseQueryString. NotSet value can be used for Premium Verizon CDN profile."
  default     = "IgnoreQueryString"
}

variable "optimization_type" {
  type        = string
  description = "What types of optimization should this CDN Endpoint optimize for? Possible values include DynamicSiteAcceleration, GeneralMediaStreaming, GeneralWebDelivery, LargeFileDownload and VideoOnDemandMediaStreaming."
  default     = null
}

variable "origin_config" {
  type = object({
    name       = string
    host_name  = string
    http_port  = number
    https_port = number
  })
  default = {
    host_name  = null
    name       = null
    http_port  = 80
    https_port = 43
  }
  description = "The set of origins of the CDN endpoint. When multiple origins exist, the first origin will be used as primary and rest will be used as failover options."
}

variable "origin_host_header" {
  type        = string
  description = "The host header CDN provider will send along with content requests to origins."
  default     = null
}

variable "origin_path" {
  type        = string
  description = "The path used at for origin requests."
  default     = null
}

variable "probe_path" {
  type        = string
  description = "the path to a file hosted on the origin which helps accelerate delivery of the dynamic content and calculate the most optimal routes for the CDN. This is relative to the origin_path."
  default     = null
}

variable "global_delivery_rule_config" {
  type        = any
  description = "Actions that are valid for all resources regardless of any conditions."
  default     = null
}

variable "delivery_rule_config" {
  type = object({
    name  = string
    order = number
  })
  description = "Rules for the rules engine. An endpoint can contain up until 4 of those rules that consist of conditions and actions."
  default = {
    name  = null
    order = null
  }
}

variable "cache_expiration_action_config" {
  type = object({
    behavior = string
    duration = string
  })
  description = "The Cache Expiration Action block"
  default = {
    behavior = null
    duration = null
  }
}

variable "cache_key_query_string_action_config" {
  type = object({
    behavior   = string
    parameters = string
  })
  description = "The Cache Key Query String Action block"
  default = {
    behavior   = null
    parameters = null
  }
}

variable "cookies_condition_config" {
  type = object({
    selector         = string
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Cookies Condition block"
  default = {
    selector         = null
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "device_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Device Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "http_version_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Http Version Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "modify_request_header_action_config" {
  type = object({
    action = string
    name   = string
    value  = string
  })
  description = "The Modify Request Header Action block"
  default = {
    action = null
    name   = null
    value  = null
  }
}

variable "modify_response_header_action_config" {
  type = object({
    action = string
    name   = string
    value  = string
  })
  description = "The Modify Response Header Action block"
  default = {
    action = null
    name   = null
    value  = null
  }
}

variable "post_arg_condition_config" {
  type = object({
    selector         = string
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Post Arg Condition block"
  default = {
    selector         = null
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "query_string_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Query String Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "remote_address_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Remote Address Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "request_body_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Request Body Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "request_header_condition_config" {
  type = object({
    selector         = string
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Request Header Condition block"
  default = {
    selector         = null
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "request_method_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Request Method Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "request_scheme_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Request Scheme Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "request_uri_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Request Uri Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "url_file_extension_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Url File Extension Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "url_file_name_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Url File Name Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "url_path_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Url Path Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "url_redirect_action_config" {
  type = object({
    redirect_type = string
    protocol      = string
    hostname      = string
    path          = string
    fragment      = string
    query_string  = string
  })
  description = "The Url Redirect Action block"
  default = {
    redirect_type = null
    protocol      = null
    hostname      = null
    path          = null
    fragment      = null
    query_string  = null
  }
}

variable "url_rewrite_action_config" {
  type = object({
    source_pattern          = string
    destination             = string
    preserve_unmatched_path = bool
  })
  description = "The Url Rewrite Action block"
  default = {
    source_pattern          = null
    destination             = null
    preserve_unmatched_path = true
  }
}

variable "endpoint_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the CDN endpoint"
  default     = null
}

#DNS Zone
variable "dns_zone_name" {
  type        = string
  description = "Name of the DNS Zone"
}

#DNS CNAME
variable "dns_cname_record_name" {
  type        = string
  description = " The name of the DNS CNAME Record."
}

variable "dns_cname_record_ttl" {
  type        = number
  description = "The Time To Live (TTL) of the DNS record in seconds."
}

variable "dns_cname_record_target_id" {
  type        = string
  description = "The target id of the CNAME record alias."
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

#keyvault secret
variable "keyvault_secret_name" {
  type        = string
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}

variable "keyvault_id" {
  type        = string
  description = "ID of Keyvault"
}

variable "keyvault_secret_value" {
  type        = string
  description = "Specifies the value of the Key Vault Secret."
}

variable "secret_content_type" {
  type        = string
  description = "Specifies the content type for the Key Vault Secret."
}

variable "secret_not_before_date" {
  type        = string
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "secret_expiration_date" {
  type        = string
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "keyvault_secret_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the keyvault secret."
}

#keyvault certificate
variable "keyvault_certificate_name" {
  type        = string
  description = "Specifies the name of the Key Vault Certificate."
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
  description = "A mapping of tags to assign to the keyvault certificate."
}

#CDN endpoint custom domain
variable "endpoint_custom_domain_name" {
  type        = string
  description = "The name which should be used for this CDN Endpoint Custom Domain. Changing this forces a new CDN Endpoint Custom Domain to be created."
}

variable "cdn_endpoint_id" {
  type        = string
  description = "The ID of the CDN Endpoint. Changing this forces a new CDN Endpoint Custom Domain to be created."
}

variable "endpoint_custom_domain_host_name" {
  type        = string
  description = "The host name of the custom domain. Changing this forces a new CDN Endpoint Custom Domain to be created."
}

variable "cdn_managed_https_certificate_type" {
  type        = string
  description = "The type of HTTPS certificate. Possible values are Shared and Dedicated."
}

variable "cdn_managed_https_protocol_type" {
  type        = string
  description = "The type of protocol. Possible values are ServerNameIndication and IPBased."
}

variable "cdn_managed_https_tls_version" {
  type        = string
  description = "The minimum TLS protocol version that is used for HTTPS. Possible values are TLS10 (representing TLS 1.0/1.1), TLS12 (representing TLS 1.2) and None (representing no minimums)."
  default     = "TLS12"
}

variable "user_managed_https_key_vault_certificate_id" {
  type        = string
  description = "The ID of the Key Vault Certificate that contains the HTTPS certificate. This is deprecated in favor of key_vault_secret_id."
}

variable "user_managed_https_key_vault_secret_id" {
  type        = string
  description = "The ID of the Key Vault Secret that contains the HTTPS certificate."
}

variable "user_managed_https_tls_version" {
  type        = string
  description = "The minimum TLS protocol version that is used for HTTPS. Possible values are TLS10 (representing TLS 1.0/1.1), TLS12 (representing TLS 1.2) and None (representing no minimums)."
  default     = "TLS12"
}
