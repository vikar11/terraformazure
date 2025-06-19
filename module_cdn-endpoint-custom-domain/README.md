<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/12/2022
## Introduction

Manages a Custom Domain for a CDN Endpoint.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

NOTE:
1. The commented out blocks can be used as per the usage requirements.
2. Only one of cdn_managed_https and user_managed_https blocks can be used.
3. For the user_managed_https block, either key_vault_certificate_id or key_vault_secret_id has to be specified.

## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)
2. DNS Zone. If not already existing, we can use the dns zone creation module:
   [module_DNSZone_Creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_DNSZone_Creation)
3. DNS CNAME Record.If not already existing, we can use the dns cname creation module:
   [module_DNSrecord_cname_Creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_DNSrecord_cname_Creation)
4. Storage account. If not already existing, we can use the storage account creation module:
   [module_storage-account](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_storage-account)
5. Key vault. If not already existing, we can use the key vault creation module:
   [module_keyvault](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_keyvault)
6. Key vault secret. If not already existing, we can use the key vault secret creation module:
   [module_keyvault_secret](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_keyvault_secret)
7. Key vault certificate. If not already existing, we can use the key vault certificate creation module:
   [module_keyvault_certificate](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_keyvault_certificate)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| <a name="module_cdn_profile_module"></a> [cdn\_profile\_module](#module\_cdn\_profile\_module) | ../../modules/module_cdn-profile | n/a |
| <a name="module_cdn_endpoint_module"></a> [cdn\_endpoint\_module](#module\_cdn\_endpoint\_module) | ../../modules/module_cdn-endpoint | n/a |
| <a name="module_keyvault_module"></a> [keyvault\_module](#module\_keyvault\_module) | ../../modules/module_keyvault | n/a |
| <a name="module_keyvault_secret_module"></a> [keyvault\_secret\_module](#module\_keyvault\_secret_\_module) | ../../modules/module_keyvault_secret | n/a |
| <a name="module_keyvault_certificate_module"></a> [keyvault\_certificate\_module](#module\_keyvault\_certificate_\_module) | ../../modules/module_keyvault_certificate | n/a |
| <a name="module_cdn_endpoint_custom_domain_module"></a> [cdn\_endpoint\_custom\_domain\_module](#module\_cdn\_endpoint\_custom\_domain\_module) | ../../modules/module_cdn-endpoint-custom-domain | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_profile.profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_profile) | resource |
| [azurerm_cdn_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_endpoint) | resource |
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_certificate.certificate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_certificate) | resource |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_dns_cname_record.dns_cname_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_cdn_endpoint_custom_domain.endpoint_custom_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_endpoint_custom_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | The object ID of an Application in Azure Active Directory. | `string` | n/a | yes |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Specifies which traffic can bypass the network rules. Possible values are AzureServices and None | `string` | n/a | yes |
| <a name="input_cache_expiration_action_config"></a> [cache\_expiration\_action\_config](#input\_cache\_expiration\_action\_config) | The Cache Expiration Action block | <pre>object({<br>    behavior = string<br>    duration = string<br>  })</pre> | <pre>{<br>  "behavior": null,<br>  "duration": null<br>}</pre> | no |
| <a name="input_cache_key_query_string_action_config"></a> [cache\_key\_query\_string\_action\_config](#input\_cache\_key\_query\_string\_action\_config) | The Cache Key Query String Action block | <pre>object({<br>    behavior   = string<br>    parameters = string<br>  })</pre> | <pre>{<br>  "behavior": null,<br>  "parameters": null<br>}</pre> | no |
| <a name="input_cdn_endpoint_id"></a> [cdn\_endpoint\_id](#input\_cdn\_endpoint\_id) | The ID of the CDN Endpoint. Changing this forces a new CDN Endpoint Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_cdn_managed_https_certificate_type"></a> [cdn\_managed\_https\_certificate\_type](#input\_cdn\_managed\_https\_certificate\_type) | The type of HTTPS certificate. Possible values are Shared and Dedicated. | `string` | n/a | yes |
| <a name="input_cdn_managed_https_protocol_type"></a> [cdn\_managed\_https\_protocol\_type](#input\_cdn\_managed\_https\_protocol\_type) | The type of protocol. Possible values are ServerNameIndication and IPBased. | `string` | n/a | yes |
| <a name="input_cdn_managed_https_tls_version"></a> [cdn\_managed\_https\_tls\_version](#input\_cdn\_managed\_https\_tls\_version) | The minimum TLS protocol version that is used for HTTPS. Possible values are TLS10 (representing TLS 1.0/1.1), TLS12 (representing TLS 1.2) and None (representing no minimums). | `string` | `"TLS12"` | no |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | contents - (Required) The base64-encoded certificate contents. password - (Optional) The password associated with the certificate. Changing this forces a new resource to be created. | <pre>object({<br>    //contents = string<br>    password = string<br>  })</pre> | n/a | yes |
| <a name="input_certificate_policy"></a> [certificate\_policy](#input\_certificate\_policy) | issuer\_parameters:name - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). key\_properties: curve - (Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key\_type is EC or EC-HSM. exportable - (Required) Is this certificate exportable? Changing this forces a new resource to be created. key\_size - (Optional) The size of the key used in the certificate. Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys. This property is required when using RSA keys. key\_type - (Required) Specifies the type of key, such as RSA or EC. reuse\_key - (Required) Is the key reusable? lifetime\_action: action\_type - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. days\_before\_expiry - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. lifetime\_percentage - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run. | <pre>list(object({<br>    issuer_parameters_name = string<br>    curve                  = string<br>    exportable             = string<br>    key_size               = string<br>    key_type               = string<br>    reuse_key              = string<br>    content_type           = string<br>    lifetime_action = list(object({<br>      action_type         = string<br>      days_before_expiry  = string<br>      lifetime_percentage = number<br>    }))<br>    x509_certificate_properties = list(object({<br>      extended_key_usage = list(string)<br>      key_usage          = list(string)<br>      subject            = string<br>      validity_in_months = string<br>      subject_alternative_names = list(object({<br>        dns_names = list(string)<br>        emails    = list(string)<br>        upns      = list(string)<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_contact_email"></a> [contact\_email](#input\_contact\_email) | E-mail address of the contact. | `string` | n/a | yes |
| <a name="input_contact_name"></a> [contact\_name](#input\_contact\_name) | Name of the contact. | `string` | n/a | yes |
| <a name="input_contact_phone"></a> [contact\_phone](#input\_contact\_phone) | Phone number of the contact. | `string` | n/a | yes |
| <a name="input_content_types_to_compress"></a> [content\_types\_to\_compress](#input\_content\_types\_to\_compress) | An array of strings that indicates a content types on which compression will be applied. The value for the elements should be MIME types. | `list(string)` | `null` | no |
| <a name="input_cookies_condition_config"></a> [cookies\_condition\_config](#input\_cookies\_condition\_config) | The Cookies Condition block | <pre>object({<br>    selector         = string<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "selector": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. Possible values are Allow and Deny. | `string` | n/a | yes |
| <a name="input_delivery_rule_config"></a> [delivery\_rule\_config](#input\_delivery\_rule\_config) | Rules for the rules engine. An endpoint can contain up until 4 of those rules that consist of conditions and actions. | <pre>object({<br>    name  = string<br>    order = number<br>  })</pre> | <pre>{<br>  "name": null,<br>  "order": null<br>}</pre> | no |
| <a name="input_device_condition_config"></a> [device\_condition\_config](#input\_device\_condition\_config) | The Device Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_dns_cname_record_name"></a> [dns\_cname\_record\_name](#input\_dns\_cname\_record\_name) | The name of the DNS CNAME Record. | `string` | n/a | yes |
| <a name="input_dns_cname_record_target_id"></a> [dns\_cname\_record\_target\_id](#input\_dns\_cname\_record\_target\_id) | The target id of the CNAME record alias. | `string` | n/a | yes |
| <a name="input_dns_cname_record_ttl"></a> [dns\_cname\_record\_ttl](#input\_dns\_cname\_record\_ttl) | The Time To Live (TTL) of the DNS record in seconds. | `number` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | Name of the DNS Zone | `string` | n/a | yes |
| <a name="input_enable_access_policy"></a> [enable\_access\_policy](#input\_enable\_access\_policy) | Want to add access policy? | `bool` | n/a | yes |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false. | `bool` | n/a | yes |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false. | `bool` | n/a | yes |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false. | `bool` | n/a | yes |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false. | `bool` | n/a | yes |
| <a name="input_endpoint_custom_domain_host_name"></a> [endpoint\_custom\_domain\_host\_name](#input\_endpoint\_custom\_domain\_host\_name) | The host name of the custom domain. Changing this forces a new CDN Endpoint Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_endpoint_custom_domain_name"></a> [endpoint\_custom\_domain\_name](#input\_endpoint\_custom\_domain\_name) | The name which should be used for this CDN Endpoint Custom Domain. Changing this forces a new CDN Endpoint Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_endpoint_name"></a> [endpoint\_name](#input\_endpoint\_name) | Specifies the name of the CDN Endpoint | `string` | n/a | yes |
| <a name="input_endpoint_tags"></a> [endpoint\_tags](#input\_endpoint\_tags) | A mapping of tags to assign to the CDN endpoint | `map(string)` | `null` | no |
| <a name="input_generate_certificate"></a> [generate\_certificate](#input\_generate\_certificate) | Wants to generate a certificate? | `bool` | n/a | yes |
| <a name="input_geo_filter_config"></a> [geo\_filter\_config](#input\_geo\_filter\_config) | A set of Geo Filters for this CDN Endpoint | <pre>object({<br>    relative_path = string<br>    action        = string<br>    country_codes = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_global_delivery_rule_config"></a> [global\_delivery\_rule\_config](#input\_global\_delivery\_rule\_config) | Actions that are valid for all resources regardless of any conditions. | `any` | `null` | no |
| <a name="input_http_version_condition_config"></a> [http\_version\_condition\_config](#input\_http\_version\_condition\_config) | The Http Version Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault | `list(string)` | n/a | yes |
| <a name="input_is_compression_enabled"></a> [is\_compression\_enabled](#input\_is\_compression\_enabled) | Indicates whether compression is to be enabled | `bool` | `false` | no |
| <a name="input_is_http_allowed"></a> [is\_http\_allowed](#input\_is\_http\_allowed) | Is http traffic enabled on the endpoint | `bool` | `true` | no |
| <a name="input_is_https_allowed"></a> [is\_https\_allowed](#input\_is\_https\_allowed) | Is https traffic enabled on the endpoint | `bool` | `true` | no |
| <a name="input_keyvault_certificate_name"></a> [keyvault\_certificate\_name](#input\_keyvault\_certificate\_name) | Specifies the name of the Key Vault Certificate. | `string` | n/a | yes |
| <a name="input_keyvault_certificate_permissions"></a> [keyvault\_certificate\_permissions](#input\_keyvault\_certificate\_permissions) | List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update. | `list(string)` | n/a | yes |
| <a name="input_keyvault_certificate_tags"></a> [keyvault\_certificate\_tags](#input\_keyvault\_certificate\_tags) | A mapping of tags to assign to the keyvault certificate. | `map(string)` | n/a | yes |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | ID of Keyvault | `string` | n/a | yes |
| <a name="input_keyvault_key_permissions"></a> [keyvault\_key\_permissions](#input\_keyvault\_key\_permissions) | List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy. | `list(string)` | n/a | yes |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | Specifies the name of the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_keyvault_secret_name"></a> [keyvault\_secret\_name](#input\_keyvault\_secret\_name) | Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_keyvault_secret_permissions"></a> [keyvault\_secret\_permissions](#input\_keyvault\_secret\_permissions) | List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set. | `list(string)` | n/a | yes |
| <a name="input_keyvault_secret_tags"></a> [keyvault\_secret\_tags](#input\_keyvault\_secret\_tags) | A mapping of tags to assign to the keyvault secret. | `map(string)` | n/a | yes |
| <a name="input_keyvault_secret_value"></a> [keyvault\_secret\_value](#input\_keyvault\_secret\_value) | Specifies the value of the Key Vault Secret. | `string` | n/a | yes |
| <a name="input_keyvault_storage_permissions"></a> [keyvault\_storage\_permissions](#input\_keyvault\_storage\_permissions) | List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update. | `list(string)` | n/a | yes |
| <a name="input_keyvault_tags"></a> [keyvault\_tags](#input\_keyvault\_tags) | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |
| <a name="input_kv_sku"></a> [kv\_sku](#input\_kv\_sku) | The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_modify_request_header_action_config"></a> [modify\_request\_header\_action\_config](#input\_modify\_request\_header\_action\_config) | The Modify Request Header Action block | <pre>object({<br>    action = string<br>    name   = string<br>    value  = string<br>  })</pre> | <pre>{<br>  "action": null,<br>  "name": null,<br>  "value": null<br>}</pre> | no |
| <a name="input_modify_response_header_action_config"></a> [modify\_response\_header\_action\_config](#input\_modify\_response\_header\_action\_config) | The Modify Response Header Action block | <pre>object({<br>    action = string<br>    name   = string<br>    value  = string<br>  })</pre> | <pre>{<br>  "action": null,<br>  "name": null,<br>  "value": null<br>}</pre> | no |
| <a name="input_optimization_type"></a> [optimization\_type](#input\_optimization\_type) | What types of optimization should this CDN Endpoint optimize for? Possible values include DynamicSiteAcceleration, GeneralMediaStreaming, GeneralWebDelivery, LargeFileDownload and VideoOnDemandMediaStreaming. | `string` | `null` | no |
| <a name="input_origin_config"></a> [origin\_config](#input\_origin\_config) | The set of origins of the CDN endpoint. When multiple origins exist, the first origin will be used as primary and rest will be used as failover options. | <pre>object({<br>    name       = string<br>    host_name  = string<br>    http_port  = number<br>    https_port = number<br>  })</pre> | <pre>{<br>  "host_name": null,<br>  "http_port": 80,<br>  "https_port": 43,<br>  "name": null<br>}</pre> | no |
| <a name="input_origin_host_header"></a> [origin\_host\_header](#input\_origin\_host\_header) | The host header CDN provider will send along with content requests to origins. | `string` | `null` | no |
| <a name="input_origin_path"></a> [origin\_path](#input\_origin\_path) | The path used at for origin requests. | `string` | `null` | no |
| <a name="input_post_arg_condition_config"></a> [post\_arg\_condition\_config](#input\_post\_arg\_condition\_config) | The Post Arg Condition block | <pre>object({<br>    selector         = string<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "selector": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_probe_path"></a> [probe\_path](#input\_probe\_path) | the path to a file hosted on the origin which helps accelerate delivery of the dynamic content and calculate the most optimal routes for the CDN. This is relative to the origin\_path. | `string` | `null` | no |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | Specifies the name of the CDN Profile | `string` | n/a | yes |
| <a name="input_profile_tags"></a> [profile\_tags](#input\_profile\_tags) | A mapping of tags to assign to the CDN Profile | `map(string)` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this Key Vault. Defaults to true. | `bool` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Purge Protection enabled for this Key Vault? Defaults to false. | `bool` | n/a | yes |
| <a name="input_query_string_condition_config"></a> [query\_string\_condition\_config](#input\_query\_string\_condition\_config) | The Query String Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_querystring_caching_behaviour"></a> [querystring\_caching\_behaviour](#input\_querystring\_caching\_behaviour) | Sets query string caching behavior. Allowed values are IgnoreQueryString, BypassCaching and UseQueryString. NotSet value can be used for Premium Verizon CDN profile. | `string` | `"IgnoreQueryString"` | no |
| <a name="input_remote_address_condition_config"></a> [remote\_address\_condition\_config](#input\_remote\_address\_condition\_config) | The Remote Address Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_request_body_condition_config"></a> [request\_body\_condition\_config](#input\_request\_body\_condition\_config) | The Request Body Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_request_header_condition_config"></a> [request\_header\_condition\_config](#input\_request\_header\_condition\_config) | The Request Header Condition block | <pre>object({<br>    selector         = string<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "selector": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_request_method_condition_config"></a> [request\_method\_condition\_config](#input\_request\_method\_condition\_config) | The Request Method Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_request_scheme_condition_config"></a> [request\_scheme\_condition\_config](#input\_request\_scheme\_condition\_config) | The Request Scheme Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_request_uri_condition_config"></a> [request\_uri\_condition\_config](#input\_request\_uri\_condition\_config) | The Request Uri Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_secret_content_type"></a> [secret\_content\_type](#input\_secret\_content\_type) | Specifies the content type for the Key Vault Secret. | `string` | n/a | yes |
| <a name="input_secret_expiration_date"></a> [secret\_expiration\_date](#input\_secret\_expiration\_date) | Expiration UTC datetime (Y-m-d'T'H:M:S'Z'). | `string` | n/a | yes |
| <a name="input_secret_not_before_date"></a> [secret\_not\_before\_date](#input\_secret\_not\_before\_date) | Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z'). | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The pricing related information of current CDN profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days. | `number` | n/a | yes |
| <a name="input_storage_account_min_tls_version"></a> [storage\_account\_min\_tls\_version](#input\_storage\_account\_min\_tls\_version) | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. | `string` | `"TLS1_2"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_queue_logging_delete"></a> [storage\_account\_queue\_logging\_delete](#input\_storage\_account\_queue\_logging\_delete) | Indicates whether all delete requests should be logged. | `bool` | n/a | yes |
| <a name="input_storage_account_queue_logging_read"></a> [storage\_account\_queue\_logging\_read](#input\_storage\_account\_queue\_logging\_read) | Indicates whether all read requests should be logged. | `bool` | n/a | yes |
| <a name="input_storage_account_queue_logging_version"></a> [storage\_account\_queue\_logging\_version](#input\_storage\_account\_queue\_logging\_version) | The version of storage analytics to configure. | `bool` | n/a | yes |
| <a name="input_storage_account_queue_logging_write"></a> [storage\_account\_queue\_logging\_write](#input\_storage\_account\_queue\_logging\_write) | Indicates whether all write requests should be logged. | `bool` | n/a | yes |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | Replication type of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | STG ACC tier | `string` | n/a | yes |
| <a name="input_url_file_extension_condition_config"></a> [url\_file\_extension\_condition\_config](#input\_url\_file\_extension\_condition\_config) | The Url File Extension Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_url_file_name_condition_config"></a> [url\_file\_name\_condition\_config](#input\_url\_file\_name\_condition\_config) | The Url File Name Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_url_path_condition_config"></a> [url\_path\_condition\_config](#input\_url\_path\_condition\_config) | The Url Path Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_url_redirect_action_config"></a> [url\_redirect\_action\_config](#input\_url\_redirect\_action\_config) | The Url Redirect Action block | <pre>object({<br>    redirect_type = string<br>    protocol      = string<br>    hostname      = string<br>    path          = string<br>    fragment      = string<br>    query_string  = string<br>  })</pre> | <pre>{<br>  "fragment": null,<br>  "hostname": null,<br>  "path": null,<br>  "protocol": null,<br>  "query_string": null,<br>  "redirect_type": null<br>}</pre> | no |
| <a name="input_url_rewrite_action_config"></a> [url\_rewrite\_action\_config](#input\_url\_rewrite\_action\_config) | The Url Rewrite Action block | <pre>object({<br>    source_pattern          = string<br>    destination             = string<br>    preserve_unmatched_path = bool<br>  })</pre> | <pre>{<br>  "destination": null,<br>  "preserve_unmatched_path": true,<br>  "source_pattern": null<br>}</pre> | no |
| <a name="input_user_managed_https_key_vault_certificate_id"></a> [user\_managed\_https\_key\_vault\_certificate\_id](#input\_user\_managed\_https\_key\_vault\_certificate\_id) | The ID of the Key Vault Certificate that contains the HTTPS certificate. This is deprecated in favor of key\_vault\_secret\_id. | `string` | n/a | yes |
| <a name="input_user_managed_https_key_vault_secret_id"></a> [user\_managed\_https\_key\_vault\_secret\_id](#input\_user\_managed\_https\_key\_vault\_secret\_id) | The ID of the Key Vault Secret that contains the HTTPS certificate. | `string` | n/a | yes |
| <a name="input_user_managed_https_tls_version"></a> [user\_managed\_https\_tls\_version](#input\_user\_managed\_https\_tls\_version) | The minimum TLS protocol version that is used for HTTPS. Possible values are TLS10 (representing TLS 1.0/1.1), TLS12 (representing TLS 1.2) and None (representing no minimums). | `string` | `"TLS12"` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet IDs which should be able to access this Key Vault. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_custom_domain_id"></a> [endpoint\_custom\_domain\_id](#output\_endpoint\_custom\_domain\_id) | The ID of the CDN Endpoint Custom Domain. |

## Module Usage

```
data "azurerm_client_config" "config" {
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  min_tls_version = var.storage_account_min_tls_version

  /*queue_properties {
    logging {
      delete = var.storage_account_queue_logging_delete
      read = var.storage_account_queue_logging_read
      version = var.storage_account_queue_logging_version
      write = var.storage_account_queue_logging_write
    }
  }*/
}

module "cdn_profile_module" {
  source = "../../modules/module_cdn-profile"

  resource_group_name = var.resource_group_name
  location            = var.location
  profile_name        = var.profile_name
  sku                 = var.sku
  profile_tags        = var.profile_tags
}

module "cdn_endpoint_module" {
  depends_on = [
    module.cdn_profile_module,
    azurerm_storage_account.storage_account
  ]
  source = "../../modules/module_cdn-endpoint"

  resource_group_name = var.resource_group_name
  location            = var.location

  #cdn profile
  profile_name = var.profile_name
  sku          = var.sku
  profile_tags = var.profile_tags

  #cdn endpoint
  endpoint_name                 = var.endpoint_name
  is_http_allowed               = var.is_http_allowed
  is_https_allowed              = var.is_http_allowed
  content_types_to_compress     = var.content_types_to_compress
  is_compression_enabled        = var.is_compression_enabled
  querystring_caching_behaviour = var.querystring_caching_behaviour
  optimization_type             = var.optimization_type
  origin_host_header            = var.origin_host_header
  origin_path                   = var.origin_path
  probe_path                    = var.probe_path
  endpoint_tags                 = var.endpoint_tags

  geo_filter_config = {
    relative_path = var.geo_filter_config.relative_path
    action        = var.geo_filter_config.action
    country_codes = var.geo_filter_config.country_codes
  }

  origin_config = {
    name       = var.origin_config.name
    host_name = azurerm_storage_account.storage_account.primary_blob_host
    http_port  = var.origin_config.http_port
    https_port = var.origin_config.https_port
  }

  global_delivery_rule_config = var.global_delivery_rule_config

  delivery_rule_config = {
    name  = var.delivery_rule_config.name
    order = var.delivery_rule_config.order
  }

  cache_expiration_action_config = {
    behavior = var.cache_expiration_action_config.behavior
    duration = var.cache_expiration_action_config.duration
  }

  cache_key_query_string_action_config = {
    behavior   = var.cache_key_query_string_action_config.behavior
    parameters = var.cache_key_query_string_action_config.parameters
  }

  cookies_condition_config = {
    selector         = var.cookies_condition_config.selector
    operator         = var.cookies_condition_config.operator
    negate_condition = var.cookies_condition_config.negate_condition
    match_values     = var.cookies_condition_config.match_values
    transforms       = var.cookies_condition_config.transforms
  }

  device_condition_config = {
    operator         = var.device_condition_config.operator
    negate_condition = var.device_condition_config.negate_condition
    match_values     = var.device_condition_config.match_values
  }

  http_version_condition_config = {
    operator         = var.http_version_condition_config.operator
    negate_condition = var.http_version_condition_config.negate_condition
    match_values     = var.http_version_condition_config.match_values
  }

  modify_request_header_action_config = {
    action = var.modify_request_header_action_config.action
    name   = var.modify_request_header_action_config.name
    value  = var.modify_request_header_action_config.value
  }

  modify_response_header_action_config = {
    action = var.modify_response_header_action_config.action
    name   = var.modify_response_header_action_config.name
    value  = var.modify_response_header_action_config.value
  }

  post_arg_condition_config = {
    selector         = var.post_arg_condition_config.selector
    operator         = var.post_arg_condition_config.operator
    negate_condition = var.post_arg_condition_config.negate_condition
    match_values     = var.post_arg_condition_config.match_values
    transforms       = var.post_arg_condition_config.transforms
  }

  query_string_condition_config = {
    operator         = var.query_string_condition_config.operator
    negate_condition = var.query_string_condition_config.negate_condition
    match_values     = var.query_string_condition_config.match_values
    transforms       = var.query_string_condition_config.transforms
  }

  remote_address_condition_config = {
    operator         = var.remote_address_condition_config.operator
    negate_condition = var.remote_address_condition_config.negate_condition
    match_values     = var.remote_address_condition_config.match_values
  }

  request_body_condition_config = {
    operator         = var.request_body_condition_config.operator
    negate_condition = var.request_body_condition_config.negate_condition
    match_values     = var.request_body_condition_config.match_values
    transforms       = var.request_body_condition_config.transforms
  }

  request_header_condition_config = {
    selector         = var.request_header_condition_config.selector
    operator         = var.request_header_condition_config.operator
    negate_condition = var.request_header_condition_config.negate_condition
    match_values     = var.request_header_condition_config.match_values
    transforms       = var.request_header_condition_config.transforms
  }

  request_method_condition_config = {
    operator         = var.request_method_condition_config.operator
    negate_condition = var.request_method_condition_config.negate_condition
    match_values     = var.request_method_condition_config.match_values
  }

  request_scheme_condition_config = {
    operator         = var.request_scheme_condition_config.operator
    negate_condition = var.request_scheme_condition_config.negate_condition
    match_values     = var.request_scheme_condition_config.match_values
  }

  request_uri_condition_config = {
    operator         = var.request_uri_condition_config.operator
    negate_condition = var.request_uri_condition_config.negate_condition
    match_values     = var.request_uri_condition_config.match_values
    transforms       = var.request_uri_condition_config.transforms
  }

  url_file_extension_condition_config = {
    operator         = var.url_file_extension_condition_config.operator
    negate_condition = var.url_file_extension_condition_config.negate_condition
    match_values     = var.url_file_extension_condition_config.match_values
    transforms       = var.url_file_extension_condition_config.transforms
  }

  url_file_name_condition_config = {
    operator         = var.url_file_name_condition_config.operator
    negate_condition = var.url_file_name_condition_config.negate_condition
    match_values     = var.url_file_name_condition_config.match_values
    transforms       = var.url_file_name_condition_config.transforms
  }

  url_path_condition_config = {
    operator         = var.url_path_condition_config.operator
    negate_condition = var.url_path_condition_config.negate_condition
    match_values     = var.url_path_condition_config.match_values
    transforms       = var.url_path_condition_config.transforms
  }

  url_redirect_action_config = {
    redirect_type = var.url_redirect_action_config.redirect_type
    protocol      = var.url_redirect_action_config.protocol
    hostname      = var.url_redirect_action_config.hostname
    path          = var.url_redirect_action_config.path
    fragment      = var.url_redirect_action_config.fragment
    query_string  = var.url_redirect_action_config.query_string
  }
  /*
  url_rewrite_action_config = {
    source_pattern          = var.url_rewrite_action_config.source_pattern
    destination             = var.url_rewrite_action_config.destination
    preserve_unmatched_path = var.url_rewrite_action_config.preserve_unmatched_path
  }
  */
}

resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_cname_record" "dns_cname_record" {
  depends_on = [
    azurerm_dns_zone.dns_zone,
    module.cdn_endpoint_module
  ]
  name                = var.dns_cname_record_name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.dns_cname_record_ttl
  target_resource_id = module.cdn_endpoint_module.cdn_endpoint_id
}

module "keyvault_module" {
  source                           = "../../modules/module_keyvault"
  location                         = var.location
  resource_group_name              = var.resource_group_name
  keyvault_name                    = var.keyvault_name
  tenant_id                        = data.azurerm_client_config.config.tenant_id //var.tenant_id
  kv_sku                           = var.kv_sku
  enabled_for_deployment           = var.enabled_for_deployment
  enabled_for_disk_encryption      = var.enabled_for_disk_encryption
  enabled_for_template_deployment  = var.enabled_for_template_deployment
  enable_rbac_authorization        = var.enable_rbac_authorization
  purge_protection_enabled         = var.purge_protection_enabled
  public_network_access_enabled    = var.public_network_access_enabled
  soft_delete_retention_days       = var.soft_delete_retention_days
  default_action                   = var.default_action
  bypass                           = var.bypass
  ip_rules                         = var.ip_rules
  virtual_network_subnet_ids       = var.virtual_network_subnet_ids
  contact_email                    = var.contact_email
  contact_name                     = var.contact_name
  contact_phone                    = var.contact_phone
  tags                             = var.keyvault_tags
  enable_access_policy             = var.enable_access_policy
  object_id                        = data.azurerm_client_config.config.object_id //var.object_id
  application_id                   = var.application_id
  keyvault_key_permissions         = var.keyvault_key_permissions
  keyvault_secret_permissions      = var.keyvault_secret_permissions
  keyvault_certificate_permissions = var.keyvault_certificate_permissions
  keyvault_storage_permissions     = var.keyvault_storage_permissions
}

module "keyvault_secret_module" {
  source = "../../modules/module_keyvault_secret"
  depends_on = [
    module.keyvault_module
  ]
  keyvault_secret = var.keyvault_secret_name
  keyvault_id            = module.keyvault_module.keyvault_id
  keyvault_secret_value  = var.keyvault_secret_value
  secret_content_type    = var.secret_content_type
  secret_not_before_date = var.secret_not_before_date
  secret_expiration_date = var.secret_expiration_date
  tags                   = var.keyvault_secret_tags
}

module "keyvault_certificate_module" {
  source               = "../../modules/module_keyvault_certificate"
  depends_on = [
    module.keyvault_module
  ]
  keyvault_certificate = var.keyvault_certificate_name
  keyvault_id          = module.keyvault_module.keyvault_id
  generate_certificate = var.generate_certificate
  certificate          = var.certificate
  certificate_policy   = var.certificate_policy
  tags                 = var.keyvault_certificate_tags
}

module "cdn_endpoint_custom_domain_module" {
  source = "../../modules/module_cdn-endpoint-custom-domain"
  depends_on = [
    azurerm_storage_account.storage_account,
    azurerm_dns_zone.dns_zone,
    azurerm_dns_cname_record.dns_cname_record,
    module.cdn_profile_module,
    module.cdn_endpoint_module,
    module.keyvault_module,
    module.keyvault_secret_module,
    module.keyvault_certificate_module
  ]

  resource_group_name = var.resource_group_name
  location            = var.location

  #azurerm_storage_account
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  storage_account_min_tls_version = var.storage_account_min_tls_version
  storage_account_queue_logging_delete = var.storage_account_queue_logging_delete
  storage_account_queue_logging_read = var.storage_account_queue_logging_read
  storage_account_queue_logging_version =  var.storage_account_queue_logging_version
  storage_account_queue_logging_write = var.storage_account_queue_logging_write

  #cdn_profile_module
  profile_name = var.profile_name
  sku          = var.sku
  profile_tags = var.profile_tags

  #cdn_endpoint_module
  endpoint_name                 = var.endpoint_name
  is_http_allowed               = var.is_http_allowed
  is_https_allowed              = var.is_http_allowed
  content_types_to_compress     = var.content_types_to_compress
  is_compression_enabled        = var.is_compression_enabled
  querystring_caching_behaviour = var.querystring_caching_behaviour
  optimization_type             = var.optimization_type
  origin_host_header            = var.origin_host_header
  origin_path                   = var.origin_path
  probe_path                    = var.probe_path
  endpoint_tags                 = var.endpoint_tags

  geo_filter_config = {
    relative_path = var.geo_filter_config.relative_path
    action        = var.geo_filter_config.action
    country_codes = var.geo_filter_config.country_codes
  }

  origin_config = {
    name       = var.origin_config.name
    host_name = azurerm_storage_account.storage_account.primary_blob_host
    http_port  = var.origin_config.http_port
    https_port = var.origin_config.https_port
  }

  global_delivery_rule_config = var.global_delivery_rule_config

  delivery_rule_config = {
    name  = var.delivery_rule_config.name
    order = var.delivery_rule_config.order
  }

  cache_expiration_action_config = {
    behavior = var.cache_expiration_action_config.behavior
    duration = var.cache_expiration_action_config.duration
  }

  cache_key_query_string_action_config = {
    behavior   = var.cache_key_query_string_action_config.behavior
    parameters = var.cache_key_query_string_action_config.parameters
  }

  cookies_condition_config = {
    selector         = var.cookies_condition_config.selector
    operator         = var.cookies_condition_config.operator
    negate_condition = var.cookies_condition_config.negate_condition
    match_values     = var.cookies_condition_config.match_values
    transforms       = var.cookies_condition_config.transforms
  }

  device_condition_config = {
    operator         = var.device_condition_config.operator
    negate_condition = var.device_condition_config.negate_condition
    match_values     = var.device_condition_config.match_values
  }

  http_version_condition_config = {
    operator         = var.http_version_condition_config.operator
    negate_condition = var.http_version_condition_config.negate_condition
    match_values     = var.http_version_condition_config.match_values
  }

  modify_request_header_action_config = {
    action = var.modify_request_header_action_config.action
    name   = var.modify_request_header_action_config.name
    value  = var.modify_request_header_action_config.value
  }

  modify_response_header_action_config = {
    action = var.modify_response_header_action_config.action
    name   = var.modify_response_header_action_config.name
    value  = var.modify_response_header_action_config.value
  }

  post_arg_condition_config = {
    selector         = var.post_arg_condition_config.selector
    operator         = var.post_arg_condition_config.operator
    negate_condition = var.post_arg_condition_config.negate_condition
    match_values     = var.post_arg_condition_config.match_values
    transforms       = var.post_arg_condition_config.transforms
  }

  query_string_condition_config = {
    operator         = var.query_string_condition_config.operator
    negate_condition = var.query_string_condition_config.negate_condition
    match_values     = var.query_string_condition_config.match_values
    transforms       = var.query_string_condition_config.transforms
  }

  remote_address_condition_config = {
    operator         = var.remote_address_condition_config.operator
    negate_condition = var.remote_address_condition_config.negate_condition
    match_values     = var.remote_address_condition_config.match_values
  }

  request_body_condition_config = {
    operator         = var.request_body_condition_config.operator
    negate_condition = var.request_body_condition_config.negate_condition
    match_values     = var.request_body_condition_config.match_values
    transforms       = var.request_body_condition_config.transforms
  }

  request_header_condition_config = {
    selector         = var.request_header_condition_config.selector
    operator         = var.request_header_condition_config.operator
    negate_condition = var.request_header_condition_config.negate_condition
    match_values     = var.request_header_condition_config.match_values
    transforms       = var.request_header_condition_config.transforms
  }

  request_method_condition_config = {
    operator         = var.request_method_condition_config.operator
    negate_condition = var.request_method_condition_config.negate_condition
    match_values     = var.request_method_condition_config.match_values
  }

  request_scheme_condition_config = {
    operator         = var.request_scheme_condition_config.operator
    negate_condition = var.request_scheme_condition_config.negate_condition
    match_values     = var.request_scheme_condition_config.match_values
  }

  request_uri_condition_config = {
    operator         = var.request_uri_condition_config.operator
    negate_condition = var.request_uri_condition_config.negate_condition
    match_values     = var.request_uri_condition_config.match_values
    transforms       = var.request_uri_condition_config.transforms
  }

  url_file_extension_condition_config = {
    operator         = var.url_file_extension_condition_config.operator
    negate_condition = var.url_file_extension_condition_config.negate_condition
    match_values     = var.url_file_extension_condition_config.match_values
    transforms       = var.url_file_extension_condition_config.transforms
  }

  url_file_name_condition_config = {
    operator         = var.url_file_name_condition_config.operator
    negate_condition = var.url_file_name_condition_config.negate_condition
    match_values     = var.url_file_name_condition_config.match_values
    transforms       = var.url_file_name_condition_config.transforms
  }

  url_path_condition_config = {
    operator         = var.url_path_condition_config.operator
    negate_condition = var.url_path_condition_config.negate_condition
    match_values     = var.url_path_condition_config.match_values
    transforms       = var.url_path_condition_config.transforms
  }

  url_redirect_action_config = {
    redirect_type = var.url_redirect_action_config.redirect_type
    protocol      = var.url_redirect_action_config.protocol
    hostname      = var.url_redirect_action_config.hostname
    path          = var.url_redirect_action_config.path
    fragment      = var.url_redirect_action_config.fragment
    query_string  = var.url_redirect_action_config.query_string
  }

  #azurerm_dns_zone
  dns_zone_name = var.dns_zone_name


  #azurerm_dns_cname_record
  dns_cname_record_name   = var.dns_cname_record_name
  dns_cname_record_ttl    = var.dns_cname_record_ttl
  dns_cname_record_target_id = var.dns_cname_record_target_id

  #keyvault_module
  keyvault_name = var.keyvault_name
  kv_sku                          = var.kv_sku
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  default_action                  = var.default_action
  bypass                          = var.bypass
  ip_rules                        = var.ip_rules
  virtual_network_subnet_ids      = var.virtual_network_subnet_ids
  contact_email                   = var.contact_email
  contact_name                    = var.contact_name
  contact_phone                   = var.contact_phone
  keyvault_tags                   = var.keyvault_tags
  enable_access_policy            = var.enable_access_policy
  application_id                   = var.application_id
  keyvault_key_permissions         = var.keyvault_key_permissions
  keyvault_secret_permissions      = var.keyvault_secret_permissions
  keyvault_certificate_permissions = var.keyvault_certificate_permissions
  keyvault_storage_permissions     = var.keyvault_storage_permissions

  #keyvault_secret_module
  keyvault_secret_name   = var.keyvault_secret_name
  keyvault_id            = module.keyvault_module.keyvault_id
  keyvault_secret_value  = var.keyvault_secret_value
  secret_content_type    = var.secret_content_type
  secret_not_before_date = var.secret_not_before_date
  secret_expiration_date = var.secret_expiration_date
  keyvault_secret_tags   = var.keyvault_secret_tags

  #keyvault_certificate_module
  keyvault_certificate_name = var.keyvault_certificate_name
  generate_certificate = var.generate_certificate
  certificate          = var.certificate
  certificate_policy   = var.certificate_policy
  keyvault_certificate_tags                 = var.keyvault_certificate_tags

  #cdn endpoint custom domain
  endpoint_custom_domain_name = var.endpoint_custom_domain_name
  cdn_endpoint_id             = module.cdn_endpoint_module.cdn_endpoint_id
  endpoint_custom_domain_host_name = join(".",[var.endpoint_name, "azureedge.net"])
  cdn_managed_https_certificate_type          = var.cdn_managed_https_certificate_type
  cdn_managed_https_protocol_type             = var.cdn_managed_https_protocol_type
  cdn_managed_https_tls_version               = var.cdn_managed_https_tls_version
  /*user_managed_https_key_vault_certificate_id = var.user_managed_https_key_vault_certificate_id
  user_managed_https_key_vault_secret_id      = module.keyvault_secret_module.secret_id*/
  user_managed_https_key_vault_certificate_id = module.keyvault_certificate_module.certificate_id
  user_managed_https_key_vault_secret_id      = var.user_managed_https_key_vault_secret_id
  user_managed_https_tls_version              = var.user_managed_https_tls_version

}
```
<!-- END_TF_DOCS -->