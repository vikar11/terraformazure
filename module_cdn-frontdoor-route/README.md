<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/12/2022
## Introduction

Manages a Front Door (standard/premium) Route.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

NOTE:
1. If https_redirect_enabled is set to true the supported_protocols field must contain both Http and Https values.
2. The https_redirect_enabled rule is the first rule that will be executed.
3. Content won't be compressed when the requested content is smaller than 1 KB or larger than 8 MB(inclusive).

## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)
2. DNS Zone. If not already existing, we can use the dns zone creation module:
   [module_DNSZone_Creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_DNSZone_Creation&version=GBdevelop)
3. Storage account. If not already existing, we can use the storage account creation module:
   [module_storage-account](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_storage-account&version=GBdevelop)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| <a name="module_cdn_frontdoor_profile_module"></a> [cdn\_frontdoor\_profile\_module](#module\_cdn\_frontdoor\_profile\_module) | ../../modules/module_cdn-frontdoor-profile | n/a |
| <a name="module_cdn_frontdoor_origin_group_module"></a> [cdn\_frontdoor\_origin\_group\_module](#module\_cdn\_frontdoor\_origin\_group\_module) | ../../modules/module_cdn-frontdoor-origin-group | n/a |
| <a name="module_cdn_frontdoor_origin_module"></a> [cdn\_frontdoor\_origin\_module](#module\_cdn\_frontdoor\_origin\_module) | ../../modules/module_cdn-frontdoor-origin | n/a |
| <a name="module_cdn_frontdoor_endpoint_module"></a> [cdn\_frontdoor\_endpoint\_module](#module\_cdn\_frontdoor\_endpoint\_module) | ../../modules/module_cdn-frontdoor-endpoint | n/a |
| <a name="module_cdn_frontdoor_custom_domain_module"></a> [cdn\_frontdoor\_custom\_domain\_module](#module\_cdn\_frontdoor\_custom\_domain\_module) | ../../modules/module_cdn-frontdoor-custom-domain | n/a |
| <a name="module_cdn_frontdoor_rule_set_module"></a> [cdn\_frontdoor\_rule\_set\_module](#module\_cdn\_frontdoor\_rule\_set\_module) | ../../modules/module_cdn-frontdoor-rule-set | n/a |
| <a name="module_cdn_frontdoor_route_module"></a> [cdn\_frontdoor\_route\_module](#module\_cdn\_frontdoor\_route\_module) | source | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |
| [azurerm_cdn_frontdoor_origin.frontdoor_origin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |
| [azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_endpoint) | resource |
| <a name="module_cdn_frontdoor_custom_domain_module"></a> [cdn\_frontdoor\_custom\_domain\_module](#module\_cdn\_frontdoor\_custom\_domain\_module) | ../../modules/module_cdn-frontdoor-custom-domain | n/a |
| [azurerm_cdn_frontdoor_rule_set.frontdoor_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule_set) | resource |
| [azurerm_cdn_frontdoor_route.frontdoor_route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | allow\_nested\_items\_to\_be\_public | `bool` | n/a | yes |
| <a name="input_cdn_frontdoor_custom_domain_ids"></a> [cdn\_frontdoor\_custom\_domain\_ids](#input\_cdn\_frontdoor\_custom\_domain\_ids) | The IDs of the Front Door Custom Domains which are associated with this Front Door Route. | `list(string)` | n/a | yes |
| <a name="input_cdn_frontdoor_endpoint_id"></a> [cdn\_frontdoor\_endpoint\_id](#input\_cdn\_frontdoor\_endpoint\_id) | The resource ID of the Front Door Endpoint where this Front Door Route should exist. Changing this forces a new Front Door Route to be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_origin_enabled"></a> [cdn\_frontdoor\_origin\_enabled](#input\_cdn\_frontdoor\_origin\_enabled) | Should the origin be enabled? Possible values are true or false. | `bool` | `true` | no |
| <a name="input_cdn_frontdoor_origin_group_id"></a> [cdn\_frontdoor\_origin\_group\_id](#input\_cdn\_frontdoor\_origin\_group\_id) | The resource ID of the Front Door Origin Group where this Front Door Route should be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_origin_ids"></a> [cdn\_frontdoor\_origin\_ids](#input\_cdn\_frontdoor\_origin\_ids) | One or more Front Door Origin resource IDs that this Front Door Route will link to. | `list(string)` | n/a | yes |
| <a name="input_cdn_frontdoor_origin_path"></a> [cdn\_frontdoor\_origin\_path](#input\_cdn\_frontdoor\_origin\_path) | A directory path on the Front Door Origin that can be used to retrieve content (e.g. contoso.cloudapp.net/originpath). | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile within which this Front Door Endpoint should exist. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_rule_set_ids"></a> [cdn\_frontdoor\_rule\_set\_ids](#input\_cdn\_frontdoor\_rule\_set\_ids) | A list of the Front Door Rule Set IDs which should be assigned to this Front Door Route. | `list(string)` | n/a | yes |
| <a name="input_certificate_name_check_enabled"></a> [certificate\_name\_check\_enabled](#input\_certificate\_name\_check\_enabled) | Specifies whether certificate name checks are enabled for this origin. | `bool` | n/a | yes |
| <a name="input_compression_enabled"></a> [compression\_enabled](#input\_compression\_enabled) | Is content compression enabled? Possible values are true or false. | `bool` | `false` | no |
| <a name="input_content_types_to_compress"></a> [content\_types\_to\_compress](#input\_content\_types\_to\_compress) | A list of one or more Content types (formerly known as MIME types) to compress. Possible values include application/eot, application/font, application/font-sfnt, application/javascript, application/json, application/opentype, application/otf, application/pkcs7-mime, application/truetype, application/ttf, application/vnd.ms-fontobject, application/xhtml+xml, application/xml, application/xml+rss, application/x-font-opentype, application/x-font-truetype, application/x-font-ttf, application/x-httpd-cgi, application/x-mpegurl, application/x-opentype, application/x-otf, application/x-perl, application/x-ttf, application/x-javascript, font/eot, font/ttf, font/otf, font/opentype, image/svg+xml, text/css, text/csv, text/html, text/javascript, text/js, text/plain, text/richtext, text/tab-separated-values, text/xml, text/x-script, text/x-component or text/x-java-source. | `list(string)` | n/a | yes |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the Azure DNS Zone which should be used for this Front Door Custom Domain. If you are using Azure to host your DNS domains, you must delegate the domain provider's domain name system (DNS) to an Azure DNS Zone. | `string` | n/a | yes |
| <a name="input_endpoint_enabled"></a> [endpoint\_enabled](#input\_endpoint\_enabled) | Specifies if this Front Door Endpoint is enabled? | `bool` | `true` | no |
| <a name="input_forwarding_protocol"></a> [forwarding\_protocol](#input\_forwarding\_protocol) | The Protocol that will be use when forwarding traffic to backends. Possible values are HttpOnly, HttpsOnly or MatchRequest. | `string` | n/a | yes |
| <a name="input_frontdoor_custom_domain_name"></a> [frontdoor\_custom\_domain\_name](#input\_frontdoor\_custom\_domain\_name) | The name which should be used for this Front Door Custom Domain. Possible values must be between 2 and 260 characters in length, must begin with a letter or number, end with a letter or number and contain only letters, numbers and hyphens. Changing this forces a new Front Door Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_endpoint_name"></a> [frontdoor\_endpoint\_name](#input\_frontdoor\_endpoint\_name) | The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_endpoint_tags"></a> [frontdoor\_endpoint\_tags](#input\_frontdoor\_endpoint\_tags) | Specifies a mapping of tags which should be assigned to the Front Door Endpoint. | `map(string)` | n/a | yes |
| <a name="input_frontdoor_origin_group_name"></a> [frontdoor\_origin\_group\_name](#input\_frontdoor\_origin\_group\_name) | The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_origin_name"></a> [frontdoor\_origin\_name](#input\_frontdoor\_origin\_name) | The name which should be used for this Front Door Origin. Changing this forces a new Front Door Origin to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_frontdoor_route_name"></a> [frontdoor\_route\_name](#input\_frontdoor\_route\_name) | The name which should be used for this Front Door Route. Valid values must begin with a letter or number, end with a letter or number and may only contain letters, numbers and hyphens with a maximum length of 90 characters. Changing this forces a new Front Door Route to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_rule_set_name"></a> [frontdoor\_rule\_set\_name](#input\_frontdoor\_rule\_set\_name) | The name which should be used for this Front Door Rule Set. Changing this forces a new Front Door Rule Set to be created. | `string` | n/a | yes |
| <a name="input_health_probe_interval_in_seconds"></a> [health\_probe\_interval\_in\_seconds](#input\_health\_probe\_interval\_in\_seconds) | Specifies the number of seconds between health probes. Possible values are between 5 and 31536000 seconds (inclusive). | `number` | n/a | yes |
| <a name="input_health_probe_path"></a> [health\_probe\_path](#input\_health\_probe\_path) | Specifies the path relative to the origin that is used to determine the health of the origin. | `string` | `"/"` | no |
| <a name="input_health_probe_protocol"></a> [health\_probe\_protocol](#input\_health\_probe\_protocol) | Specifies the protocol to use for health probe. Possible values are Http and Https. | `string` | n/a | yes |
| <a name="input_health_probe_request_type"></a> [health\_probe\_request\_type](#input\_health\_probe\_request\_type) | Specifies the type of health probe request that is made. Possible values are GET and HEAD. | `string` | `"HEAD"` | no |
| <a name="input_host_name"></a> [host\_name](#input\_host\_name) | The IPv4 address, IPv6 address or Domain name of the Origin. | `string` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The value of the HTTP port. Must be between 1 and 65535. | `number` | `80` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The value of the HTTPS port. Must be between 1 and 65535. | `number` | `443` | no |
| <a name="input_https_redirect_enabled"></a> [https\_redirect\_enabled](#input\_https\_redirect\_enabled) | Automatically redirect HTTP traffic to HTTPS traffic? Possible values are true or false. | `bool` | `true` | no |
| <a name="input_link_to_default_domain"></a> [link\_to\_default\_domain](#input\_link\_to\_default\_domain) | Should this Front Door Route be linked to the default endpoint? Possible values include true or false. | `bool` | `true` | no |
| <a name="input_load_balancing_additional_latency_in_milliseconds"></a> [load\_balancing\_additional\_latency\_in\_milliseconds](#input\_load\_balancing\_additional\_latency\_in\_milliseconds) | Specifies the additional latency in milliseconds for probes to fall into the lowest latency bucket. Possible values are between 0 and 1000 seconds (inclusive). | `number` | `50` | no |
| <a name="input_load_balancing_sample_size"></a> [load\_balancing\_sample\_size](#input\_load\_balancing\_sample\_size) | Specifies the number of samples to consider for load balancing decisions. Possible values are between 0 and 255 (inclusive). | `number` | `4` | no |
| <a name="input_load_balancing_successful_samples_required"></a> [load\_balancing\_successful\_samples\_required](#input\_load\_balancing\_successful\_samples\_required) | Specifies the number of samples within the sample period that must succeed. Possible values are between 0 and 255 (inclusive). | `number` | `3` | no |
| <a name="input_network_rules_default_action"></a> [network\_rules\_default\_action](#input\_network\_rules\_default\_action) | Default action of the network rules | `string` | n/a | yes |
| <a name="input_origin_host_header"></a> [origin\_host\_header](#input\_origin\_host\_header) | The host header value (an IPv4 address, IPv6 address or Domain name) which is sent to the origin with each request. If unspecified the hostname from the request will be used. | `string` | n/a | yes |
| <a name="input_patterns_to_match"></a> [patterns\_to\_match](#input\_patterns\_to\_match) | The route patterns of the rule. | `list(string)` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Priority of origin in given origin group for load balancing. Higher priorities will not be used for load balancing if any lower priority origin is healthy. Must be between 1 and 5 (inclusive). | `number` | `1` | no |
| <a name="input_private_link_location"></a> [private\_link\_location](#input\_private\_link\_location) | Specifies the location where the Private Link resource should exist. | `string` | n/a | yes |
| <a name="input_private_link_private_link_target_id"></a> [private\_link\_private\_link\_target\_id](#input\_private\_link\_private\_link\_target\_id) | The ID of the Azure Resource to connect to via the Private Link. | `string` | n/a | yes |
| <a name="input_private_link_request_message"></a> [private\_link\_request\_message](#input\_private\_link\_request\_message) | Specifies the request message that will be submitted to the private\_link\_target\_id when requesting the private link endpoint connection. Values must be between 1 and 140 characters in length. | `string` | `"Access request for Front Door Private Link Origin"` | no |
| <a name="input_private_link_target_type"></a> [private\_link\_target\_type](#input\_private\_link\_target\_type) | Specifies the type of target for this Private Link Endpoint. Possible values are blob, blob\_secondary, web and sites | `string` | n/a | yes |
| <a name="input_query_string_caching_behavior"></a> [query\_string\_caching\_behavior](#input\_query\_string\_caching\_behavior) | Defines how the Front Door Route will cache requests that include query strings. Possible values include IgnoreQueryString, IgnoreSpecifiedQueryStrings, IncludeSpecifiedQueryStrings or UseQueryString. | `string` | `"IgnoreQueryString"` | no |
| <a name="input_query_strings"></a> [query\_strings](#input\_query\_strings) | Query strings to include or ignore. | `list(string)` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | location of rg | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_restore_traffic_time_to_healed_or_new_endpoint_in_minutes"></a> [restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes](#input\_restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes) | Specifies the amount of time which should elapse before shifting traffic to another endpoint when a healthy endpoint becomes unhealthy or a new endpoint is added. Possible values are between 0 and 50 minutes (inclusive). | `number` | `10` | no |
| <a name="input_route_enabled"></a> [route\_enabled](#input\_route\_enabled) | Is this Front Door Route enabled? Possible values are true or false. | `bool` | `true` | no |
| <a name="input_session_affinity_enabled"></a> [session\_affinity\_enabled](#input\_session\_affinity\_enabled) | Specifies whether session affinity should be enabled on this host. | `bool` | `true` | no |
| <a name="input_stg_tags"></a> [stg\_tags](#input\_stg\_tags) | Tags for stg acc | `map(string)` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | Replication type of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | STG ACC tier | `string` | n/a | yes |
| <a name="input_supported_protocols"></a> [supported\_protocols](#input\_supported\_protocols) | One or more Protocols supported by this Front Door Route. Possible values are Http or Https. | `list(string)` | n/a | yes |
| <a name="input_tls_cdn_frontdoor_secret_id"></a> [tls\_cdn\_frontdoor\_secret\_id](#input\_tls\_cdn\_frontdoor\_secret\_id) | Resource ID of the Front Door Secret. | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | Defines the source of the SSL certificate. Possible values include CustomerCertificate and ManagedCertificate. | `string` | `"ManagedCertificate"` | no |
| <a name="input_tls_minimum_tls_version"></a> [tls\_minimum\_tls\_version](#input\_tls\_minimum\_tls\_version) | TLS protocol version that will be used for Https. Possible values include TLS10 and TLS12. | `string` | `"TLS12"` | no |
| <a name="input_weight"></a> [weight](#input\_weight) | The weight of the origin in a given origin group for load balancing. Must be between 1 and 1000. | `number` | `500` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_route_id"></a> [frontdoor\_route\_id](#output\_frontdoor\_route\_id) | The ID of the Front Door Route. |

## Module Usage

```
resource "azurerm_dns_zone" "dns_zone" {
  name                = "mydomainref.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public

  network_rules {
    default_action = var.network_rules_default_action
  }

  tags = var.stg_tags
}

module "cdn_frontdoor_profile_module" {
  source = "../../modules/module_cdn-frontdoor-profile"

  resource_group_name        = var.resource_group_name
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags
}

module "cdn_frontdoor_origin_group_module" {
  source = "../../modules/module_cdn-frontdoor-origin-group"

  depends_on = [
    module.cdn_frontdoor_profile_module
  ]

  resource_group_name = var.resource_group_name

  #cdn frontdoor profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn frontdoor origin group
  frontdoor_origin_group_name = var.frontdoor_origin_group_name
  cdn_frontdoor_profile_id                                  = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  load_balancing_additional_latency_in_milliseconds         = var.load_balancing_additional_latency_in_milliseconds
  load_balancing_sample_size                                = var.load_balancing_sample_size
  load_balancing_successful_samples_required                = var.load_balancing_successful_samples_required
  health_probe_protocol                                     = var.health_probe_protocol
  health_probe_interval_in_seconds                          = var.health_probe_interval_in_seconds
  health_probe_request_type                                 = var.health_probe_request_type
  health_probe_path                                         = var.health_probe_path
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time_to_healed_or_new_endpoint_in_minutes
  session_affinity_enabled                                  = var.session_affinity_enabled
}

module "cdn_frontdoor_origin_module" {
  source = "../../modules/module_cdn-frontdoor-origin"

  depends_on = [
    module.cdn_frontdoor_profile_module,
    module.cdn_frontdoor_origin_group_module,
    azurerm_storage_account.storage_account
  ]

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  #cdn frontdoor profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn frontdoor origin group
  frontdoor_origin_group_name = var.frontdoor_origin_group_name
  cdn_frontdoor_profile_id                                  = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  load_balancing_additional_latency_in_milliseconds         = var.load_balancing_additional_latency_in_milliseconds
  load_balancing_sample_size                                = var.load_balancing_sample_size
  load_balancing_successful_samples_required                = var.load_balancing_successful_samples_required
  health_probe_protocol                                     = var.health_probe_protocol
  health_probe_interval_in_seconds                          = var.health_probe_interval_in_seconds
  health_probe_request_type                                 = var.health_probe_request_type
  health_probe_path                                         = var.health_probe_path
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time_to_healed_or_new_endpoint_in_minutes
  session_affinity_enabled                                  = var.session_affinity_enabled

  #storage account
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  network_rules_default_action     = var.network_rules_default_action
  stg_tags                         = var.stg_tags

  #origin
  frontdoor_origin_name = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id = module.cdn_frontdoor_origin_group_module.frontdoor_origin_group_id
  host_name                      = azurerm_storage_account.storage_account.primary_blob_host
  certificate_name_check_enabled = var.certificate_name_check_enabled
  cdn_frontdoor_origin_enabled   = var.cdn_frontdoor_origin_enabled
  http_port                      = var.http_port
  https_port                     = var.https_port
  origin_host_header = azurerm_storage_account.storage_account.primary_blob_host
  priority           = var.priority

  private_link_request_message = var.private_link_request_message
  private_link_target_type     = var.private_link_target_type
  private_link_location = azurerm_storage_account.storage_account.location
  private_link_private_link_target_id = azurerm_storage_account.storage_account.id

  weight = var.weight
}

module "cdn_frontdoor_endpoint_module" {
  source = "../../modules/module_cdn-frontdoor-endpoint"

  resource_group_name = var.resource_group_name

  #cdn frontdoor profile
  frontdoor_profile_name = var.frontdoor_profile_name
  sku_name               = var.frontdoor_profile_sku_name
  frontdoor_profile_tags = var.frontdoor_profile_tags

  #cdn frontdoor endpoint
  frontdoor_endpoint_name = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  endpoint_enabled         = var.endpoint_enabled
  frontdoor_endpoint_tags  = var.frontdoor_endpoint_tags
}

module "cdn_frontdoor_custom_domain_module" {
  source = "../../modules/module_cdn-frontdoor-custom-domain"

  depends_on = [
    azurerm_dns_zone.dns_zone,
    module.cdn_frontdoor_profile_module
  ]
  resource_group_name = var.resource_group_name

  #cdn profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn custom domain
  frontdoor_custom_domain_name = var.frontdoor_custom_domain_name
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  host_name                = var.host_name
  dns_zone_id                 = azurerm_dns_zone.dns_zone.id
  tls_certificate_type        = var.tls_certificate_type
  tls_minimum_tls_version     = var.tls_minimum_tls_version
  tls_cdn_frontdoor_secret_id = var.tls_cdn_frontdoor_secret_id
}

module "cdn_frontdoor_rule_set_module" {
  source = "../../modules/module_cdn-frontdoor-rule-set"

  depends_on = [
    module.cdn_frontdoor_profile_module
  ]

  resource_group_name = var.resource_group_name

  #cdn profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn frontdoor rule set
  frontdoor_rule_set_name  = var.frontdoor_rule_set_name
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
}

module "cdn_frontdoor_route_module" {
  source = "../../modules/module_cdn-frontdoor-route"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  depends_on = [
    azurerm_dns_zone.dns_zone,
    azurerm_storage_account.storage_account,
    module.cdn_frontdoor_profile_module,
    module.cdn_frontdoor_origin_group_module,
    module.cdn_frontdoor_origin_module,
    module.cdn_frontdoor_endpoint_module,
    module.cdn_frontdoor_custom_domain_module,
    module.cdn_frontdoor_rule_set_module
  ]

  #cdn frontdoor profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn frontdoor origin group
  frontdoor_origin_group_name = var.frontdoor_origin_group_name
  cdn_frontdoor_profile_id                                  = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  load_balancing_additional_latency_in_milliseconds         = var.load_balancing_additional_latency_in_milliseconds
  load_balancing_sample_size                                = var.load_balancing_sample_size
  load_balancing_successful_samples_required                = var.load_balancing_successful_samples_required
  health_probe_protocol                                     = var.health_probe_protocol
  health_probe_interval_in_seconds                          = var.health_probe_interval_in_seconds
  health_probe_request_type                                 = var.health_probe_request_type
  health_probe_path                                         = var.health_probe_path
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time_to_healed_or_new_endpoint_in_minutes
  session_affinity_enabled                                  = var.session_affinity_enabled

  #storage account
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  network_rules_default_action     = var.network_rules_default_action
  stg_tags                         = var.stg_tags

  #origin
  frontdoor_origin_name = var.frontdoor_origin_name
  host_name                      = azurerm_storage_account.storage_account.primary_blob_host
  certificate_name_check_enabled = var.certificate_name_check_enabled
  cdn_frontdoor_origin_enabled   = var.cdn_frontdoor_origin_enabled
  http_port                      = var.http_port
  https_port                     = var.https_port
  origin_host_header = azurerm_storage_account.storage_account.primary_blob_host
  priority           = var.priority

  private_link_request_message = var.private_link_request_message
  private_link_target_type     = var.private_link_target_type
  private_link_location = azurerm_storage_account.storage_account.location
  private_link_private_link_target_id = azurerm_storage_account.storage_account.id

  weight = var.weight

  #cdn frontdoor endpoint
  frontdoor_endpoint_name = var.frontdoor_endpoint_name
  endpoint_enabled        = var.endpoint_enabled
  frontdoor_endpoint_tags = var.frontdoor_endpoint_tags

  #cdn custom domain
  frontdoor_custom_domain_name = var.frontdoor_custom_domain_name
  dns_zone_id                 = var.dns_zone_id
  tls_certificate_type        = var.tls_certificate_type
  tls_minimum_tls_version     = var.tls_minimum_tls_version
  tls_cdn_frontdoor_secret_id = var.tls_cdn_frontdoor_secret_id

  #cdn frontdoor rule set
  frontdoor_rule_set_name = var.frontdoor_rule_set_name

  #cdn frontdoor route
  frontdoor_route_name            = var.frontdoor_route_name
  cdn_frontdoor_endpoint_id       = module.cdn_frontdoor_endpoint_module.frontdoor_endpoint_id
  cdn_frontdoor_origin_group_id   = module.cdn_frontdoor_origin_group_module.frontdoor_origin_group_id
  cdn_frontdoor_origin_ids        = [module.cdn_frontdoor_origin_module.frontdoor_origin_id]
  cdn_frontdoor_custom_domain_ids = [module.cdn_frontdoor_custom_domain_module.frontdoor_custom_domain_id]
  cdn_frontdoor_origin_path       = var.cdn_frontdoor_origin_path
  cdn_frontdoor_rule_set_ids      = [module.cdn_frontdoor_rule_set_module.frontdoor_rule_set_id]
  forwarding_protocol             = var.forwarding_protocol
  patterns_to_match               = var.patterns_to_match
  supported_protocols             = var.supported_protocols
  query_string_caching_behavior   = var.query_string_caching_behavior
  query_strings                   = var.query_strings
  compression_enabled             = var.compression_enabled
  content_types_to_compress       = var.content_types_to_compress
  route_enabled                   = var.route_enabled
  https_redirect_enabled          = var.https_redirect_enabled
  link_to_default_domain          = var.link_to_default_domain
}
```
<!-- END_TF_DOCS -->