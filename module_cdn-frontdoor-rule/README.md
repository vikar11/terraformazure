<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/12/2022
## Introduction

Manages a Front Door (standard/premium) Rule.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

NOTE:
1. If the Front Door Rule has an order value of 0 they do not require any conditions and the actions will always be applied.
2. You may include up to 5 separate actions in the actions block. Due to this, some of the actions and blocks are commented out whcih we can uncomment and use as per our requirements.
3. You may include up to 10 separate conditions in the conditions block. Due to this, some of the actions and blocks are commented out whcih we can uncomment and use as per our requirements.
4. If the cdn_frontdoor_origin_group_id is not defined you cannot set the forwarding_protocol.


## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)
2. Storage account. If not already existing, we can use the storage account creation module:
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
| <a name="module_cdn_frontdoor_rule_set_module"></a> [cdn\_frontdoor\_rule\_set\_module](#module\_cdn\_frontdoor\_rule\_set\_module) | ../../modules/module_cdn-frontdoor-rule-set | n/a |
| <a name="module_cdn_frontdoor_rule_module"></a> [cdn\_frontdoor\_rule\_module](#module\_cdn\_frontdoor\_rule\_module) | ../../modules/module_cdn-frontdoor-rule | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |
| [azurerm_cdn_frontdoor_origin.frontdoor_origin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |
| [azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_endpoint) | resource |
| [azurerm_cdn_frontdoor_rule_set.frontdoor_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule_set) | resource |
| [azurerm_cdn_frontdoor_rule.frontdoor_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | allow\_nested\_items\_to\_be\_public | `bool` | n/a | yes |
| <a name="input_behavior_on_match"></a> [behavior\_on\_match](#input\_behavior\_on\_match) | If this rule is a match should the rules engine continue processing the remaining rules or stop? Possible values are Continue and Stop. | `string` | `"Continue"` | no |
| <a name="input_cdn_frontdoor_origin_enabled"></a> [cdn\_frontdoor\_origin\_enabled](#input\_cdn\_frontdoor\_origin\_enabled) | Should the origin be enabled? Possible values are true or false. | `bool` | `true` | no |
| <a name="input_cdn_frontdoor_origin_group_id"></a> [cdn\_frontdoor\_origin\_group\_id](#input\_cdn\_frontdoor\_origin\_group\_id) | The ID of the Front Door Origin Group within which this Front Door Origin should exist. Changing this forces a new Front Door Origin to be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile. Changing this forces a new Front Door Rule Set to be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_rule_set_id"></a> [cdn\_frontdoor\_rule\_set\_id](#input\_cdn\_frontdoor\_rule\_set\_id) | The resource ID of the Front Door Rule Set for this Front Door Rule. Changing this forces a new Front Door Rule to be created. | `string` | n/a | yes |
| <a name="input_certificate_name_check_enabled"></a> [certificate\_name\_check\_enabled](#input\_certificate\_name\_check\_enabled) | Specifies whether certificate name checks are enabled for this origin. | `bool` | n/a | yes |
| <a name="input_client_port_condition_config"></a> [client\_port\_condition\_config](#input\_client\_port\_condition\_config) | The Client Port block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_cookies_condition_config"></a> [cookies\_condition\_config](#input\_cookies\_condition\_config) | The Cookies Condition block | <pre>object({<br>    cookie_name      = string<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "cookie_name": null,<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_endpoint_enabled"></a> [endpoint\_enabled](#input\_endpoint\_enabled) | Specifies if this Front Door Endpoint is enabled? | `bool` | `true` | no |
| <a name="input_frontdoor_endpoint_name"></a> [frontdoor\_endpoint\_name](#input\_frontdoor\_endpoint\_name) | The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_endpoint_tags"></a> [frontdoor\_endpoint\_tags](#input\_frontdoor\_endpoint\_tags) | Specifies a mapping of tags which should be assigned to the Front Door Endpoint. | `map(string)` | n/a | yes |
| <a name="input_frontdoor_origin_group_name"></a> [frontdoor\_origin\_group\_name](#input\_frontdoor\_origin\_group\_name) | The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_origin_name"></a> [frontdoor\_origin\_name](#input\_frontdoor\_origin\_name) | The name which should be used for this Front Door Origin. Changing this forces a new Front Door Origin to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_frontdoor_rule_name"></a> [frontdoor\_rule\_name](#input\_frontdoor\_rule\_name) | The name which should be used for this Front Door Rule. Possible values must be between 1 and 260 characters in length, begin with a letter and may contain only letters and numbers. Changing this forces a new Front Door Rule to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_rule_set_name"></a> [frontdoor\_rule\_set\_name](#input\_frontdoor\_rule\_set\_name) | The name which should be used for this Front Door Rule Set. Changing this forces a new Front Door Rule Set to be created. | `string` | n/a | yes |
| <a name="input_health_probe_interval_in_seconds"></a> [health\_probe\_interval\_in\_seconds](#input\_health\_probe\_interval\_in\_seconds) | Specifies the number of seconds between health probes. Possible values are between 5 and 31536000 seconds (inclusive). | `number` | n/a | yes |
| <a name="input_health_probe_path"></a> [health\_probe\_path](#input\_health\_probe\_path) | Specifies the path relative to the origin that is used to determine the health of the origin. | `string` | `"/"` | no |
| <a name="input_health_probe_protocol"></a> [health\_probe\_protocol](#input\_health\_probe\_protocol) | Specifies the protocol to use for health probe. Possible values are Http and Https. | `string` | n/a | yes |
| <a name="input_health_probe_request_type"></a> [health\_probe\_request\_type](#input\_health\_probe\_request\_type) | Specifies the type of health probe request that is made. Possible values are GET and HEAD. | `string` | `"HEAD"` | no |
| <a name="input_host_name"></a> [host\_name](#input\_host\_name) | The IPv4 address, IPv6 address or Domain name of the Origin. | `string` | n/a | yes |
| <a name="input_host_name_condition_config"></a> [host\_name\_condition\_config](#input\_host\_name\_condition\_config) | The Host Name block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The value of the HTTP port. Must be between 1 and 65535. | `number` | `80` | no |
| <a name="input_http_version_condition_config"></a> [http\_version\_condition\_config](#input\_http\_version\_condition\_config) | The Http Version Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The value of the HTTPS port. Must be between 1 and 65535. | `number` | `443` | no |
| <a name="input_is_device_condition_config"></a> [is\_device\_condition\_config](#input\_is\_device\_condition\_config) | The Device Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_load_balancing_additional_latency_in_milliseconds"></a> [load\_balancing\_additional\_latency\_in\_milliseconds](#input\_load\_balancing\_additional\_latency\_in\_milliseconds) | Specifies the additional latency in milliseconds for probes to fall into the lowest latency bucket. Possible values are between 0 and 1000 seconds (inclusive). | `number` | `50` | no |
| <a name="input_load_balancing_sample_size"></a> [load\_balancing\_sample\_size](#input\_load\_balancing\_sample\_size) | Specifies the number of samples to consider for load balancing decisions. Possible values are between 0 and 255 (inclusive). | `number` | `4` | no |
| <a name="input_load_balancing_successful_samples_required"></a> [load\_balancing\_successful\_samples\_required](#input\_load\_balancing\_successful\_samples\_required) | Specifies the number of samples within the sample period that must succeed. Possible values are between 0 and 255 (inclusive). | `number` | `3` | no |
| <a name="input_network_rules_default_action"></a> [network\_rules\_default\_action](#input\_network\_rules\_default\_action) | Default action of the network rules | `string` | n/a | yes |
| <a name="input_order"></a> [order](#input\_order) | The order in which the rules will be applied for the Front Door Endpoint. The order value should be sequential and begin at 1(e.g. 1, 2, 3…). A Front Door Rule with a lesser order value will be applied before a rule with a greater order value. | `number` | n/a | yes |
| <a name="input_origin_host_header"></a> [origin\_host\_header](#input\_origin\_host\_header) | The host header value (an IPv4 address, IPv6 address or Domain name) which is sent to the origin with each request. If unspecified the hostname from the request will be used. | `string` | n/a | yes |
| <a name="input_post_args_condition_config"></a> [post\_args\_condition\_config](#input\_post\_args\_condition\_config) | The Post Args Condition block | <pre>object({<br>    post_args_name   = string<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "post_args_name": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Priority of origin in given origin group for load balancing. Higher priorities will not be used for load balancing if any lower priority origin is healthy. Must be between 1 and 5 (inclusive). | `number` | `1` | no |
| <a name="input_private_link_location"></a> [private\_link\_location](#input\_private\_link\_location) | Specifies the location where the Private Link resource should exist. | `string` | n/a | yes |
| <a name="input_private_link_private_link_target_id"></a> [private\_link\_private\_link\_target\_id](#input\_private\_link\_private\_link\_target\_id) | The ID of the Azure Resource to connect to via the Private Link. | `string` | n/a | yes |
| <a name="input_private_link_request_message"></a> [private\_link\_request\_message](#input\_private\_link\_request\_message) | Specifies the request message that will be submitted to the private\_link\_target\_id when requesting the private link endpoint connection. Values must be between 1 and 140 characters in length. | `string` | `"Access request for Front Door Private Link Origin"` | no |
| <a name="input_private_link_target_type"></a> [private\_link\_target\_type](#input\_private\_link\_target\_type) | Specifies the type of target for this Private Link Endpoint. Possible values are blob, blob\_secondary, web and sites | `string` | n/a | yes |
| <a name="input_query_string_condition_config"></a> [query\_string\_condition\_config](#input\_query\_string\_condition\_config) | The Query String Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_remote_address_condition_config"></a> [remote\_address\_condition\_config](#input\_remote\_address\_condition\_config) | The Remote Address Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_request_body_condition_config"></a> [request\_body\_condition\_config](#input\_request\_body\_condition\_config) | The Request Body Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_request_header_action_config"></a> [request\_header\_action\_config](#input\_request\_header\_action\_config) | The Request Header Action block | <pre>object({<br>    header_action = string<br>    header_name   = string<br>    value  = string<br>  })</pre> | <pre>{<br>  "header_action": null,<br>  "header_name": null,<br>  "value": null<br>}</pre> | no |
| <a name="input_request_header_condition_config"></a> [request\_header\_condition\_config](#input\_request\_header\_condition\_config) | The Request Header Condition block | <pre>object({<br>    header_name      = string<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "header_name": null,<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_request_method_condition_config"></a> [request\_method\_condition\_config](#input\_request\_method\_condition\_config) | The Request Method Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_request_scheme_condition_config"></a> [request\_scheme\_condition\_config](#input\_request\_scheme\_condition\_config) | The Request Scheme Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_request_uri_condition_config"></a> [request\_uri\_condition\_config](#input\_request\_uri\_condition\_config) | The Request Uri Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the RG | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_response_header_action_config"></a> [response\_header\_action\_config](#input\_response\_header\_action\_config) | The Response Header Action block | <pre>object({<br>    header_action = string<br>    header_name   = string<br>    value  = string<br>  })</pre> | <pre>{<br>  "header_action": null,<br>  "header_name": null,<br>  "value": null<br>}</pre> | no |
| <a name="input_restore_traffic_time_to_healed_or_new_endpoint_in_minutes"></a> [restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes](#input\_restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes) | Specifies the amount of time which should elapse before shifting traffic to another endpoint when a healthy endpoint becomes unhealthy or a new endpoint is added. Possible values are between 0 and 50 minutes (inclusive). | `number` | `10` | no |
| <a name="input_route_configuration_override_action_config"></a> [route\_configuration\_override\_action\_config](#input\_route\_configuration\_override\_action\_config) | n/a | <pre>object({<br>    cache_duration = string<br>    cdn_frontdoor_origin_group_id = string<br>    forwarding_protocol = string<br>    query_string_caching_behavior = string<br>    query_string_parameters = list(string)<br>    compression_enabled = bool<br>    cache_behavior = string<br>  })</pre> | <pre>{<br>  "cache_behavior": null,<br>  "cache_duration": null,<br>  "cdn_frontdoor_origin_group_id": null,<br>  "compression_enabled": false,<br>  "forwarding_protocol": null,<br>  "query_string_caching_behavior": null,<br>  "query_string_parameters": [<br>    null<br>  ]<br>}</pre> | no |
| <a name="input_server_port_condition_config"></a> [server\_port\_condition\_config](#input\_server\_port\_condition\_config) | The Server Port block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_session_affinity_enabled"></a> [session\_affinity\_enabled](#input\_session\_affinity\_enabled) | Specifies whether session affinity should be enabled on this host. | `bool` | `true` | no |
| <a name="input_socket_address_condition_config"></a> [socket\_address\_condition\_config](#input\_socket\_address\_condition\_config) | The Socket Address block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_ssl_protocol_condition_config"></a> [ssl\_protocol\_condition\_config](#input\_ssl\_protocol\_condition\_config) | The SSL protocol block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null<br>}</pre> | no |
| <a name="input_stg_tags"></a> [stg\_tags](#input\_stg\_tags) | Tags for stg acc | `map(string)` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | Replication type of the storage account | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | STG ACC tier | `string` | n/a | yes |
| <a name="input_url_file_extension_condition_config"></a> [url\_file\_extension\_condition\_config](#input\_url\_file\_extension\_condition\_config) | The Url File Extension Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_url_filename_condition_config"></a> [url\_filename\_condition\_config](#input\_url\_filename\_condition\_config) | The Url File Name Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_url_path_condition_config"></a> [url\_path\_condition\_config](#input\_url\_path\_condition\_config) | The Url Path Condition block | <pre>object({<br>    operator         = string<br>    negate_condition = bool<br>    match_values     = list(string)<br>    transforms       = list(string)<br>  })</pre> | <pre>{<br>  "match_values": null,<br>  "negate_condition": false,<br>  "operator": null,<br>  "transforms": null<br>}</pre> | no |
| <a name="input_url_redirect_action_config"></a> [url\_redirect\_action\_config](#input\_url\_redirect\_action\_config) | n/a | <pre>object({<br>    redirect_type = string<br>    destination_hostname = string<br>    redirect_protocol = string<br>    destination_path = string<br>    query_string = string<br>    destination_fragment = string<br>  })</pre> | <pre>{<br>  "destination_fragment": null,<br>  "destination_hostname": null,<br>  "destination_path": null,<br>  "query_string": null,<br>  "redirect_protocol": null,<br>  "redirect_type": null<br>}</pre> | no |
| <a name="input_url_rewrite_action_config"></a> [url\_rewrite\_action\_config](#input\_url\_rewrite\_action\_config) | n/a | <pre>object({<br>    source_pattern = string<br>    destination = string<br>    preserve_unmatched_path = bool<br>  })</pre> | <pre>{<br>  "destination": null,<br>  "preserve_unmatched_path": false,<br>  "source_pattern": null<br>}</pre> | no |
| <a name="input_weight"></a> [weight](#input\_weight) | The weight of the origin in a given origin group for load balancing. Must be between 1 and 1000. | `number` | `500` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_rule_cdn_frontdoor_rule_set_name"></a> [frontdoor\_rule\_cdn\_frontdoor\_rule\_set\_name](#output\_frontdoor\_rule\_cdn\_frontdoor\_rule\_set\_name) | The name of the Front Door Rule Set containing this Front Door Rule. |
| <a name="output_frontdoor_rule_id"></a> [frontdoor\_rule\_id](#output\_frontdoor\_rule\_id) | The ID of the Front Door Rule. |

## Module Usage
```
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
  frontdoor_origin_group_name                               = var.frontdoor_origin_group_name
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
  frontdoor_origin_group_name                               = var.frontdoor_origin_group_name
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
  frontdoor_origin_name          = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id  = module.cdn_frontdoor_origin_group_module.frontdoor_origin_group_id
  host_name                      = azurerm_storage_account.storage_account.primary_blob_host
  certificate_name_check_enabled = var.certificate_name_check_enabled
  cdn_frontdoor_origin_enabled   = var.cdn_frontdoor_origin_enabled
  http_port                      = var.http_port
  https_port                     = var.https_port
  origin_host_header             = azurerm_storage_account.storage_account.primary_blob_host
  priority                       = var.priority

  private_link_request_message        = var.private_link_request_message
  private_link_target_type            = var.private_link_target_type
  private_link_location               = azurerm_storage_account.storage_account.location
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
  frontdoor_endpoint_name  = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  endpoint_enabled         = var.endpoint_enabled
  frontdoor_endpoint_tags  = var.frontdoor_endpoint_tags
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

module "cdn_frontdoor_rule_module" {
  source = "../../modules/module_cdn-frontdoor-rule"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  depends_on = [
    azurerm_storage_account.storage_account,
    module.cdn_frontdoor_profile_module,
    module.cdn_frontdoor_origin_group_module,
    module.cdn_frontdoor_origin_module,
    module.cdn_frontdoor_endpoint_module
  ]

  #cdn frontdoor profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn frontdoor origin group
  frontdoor_origin_group_name                               = var.frontdoor_origin_group_name
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
  frontdoor_origin_name          = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id  = module.cdn_frontdoor_origin_group_module.frontdoor_origin_group_id
  host_name                      = azurerm_storage_account.storage_account.primary_blob_host
  certificate_name_check_enabled = var.certificate_name_check_enabled
  cdn_frontdoor_origin_enabled   = var.cdn_frontdoor_origin_enabled
  http_port                      = var.http_port
  https_port                     = var.https_port
  origin_host_header             = azurerm_storage_account.storage_account.primary_blob_host
  priority                       = var.priority

  private_link_request_message        = var.private_link_request_message
  private_link_target_type            = var.private_link_target_type
  private_link_location               = azurerm_storage_account.storage_account.location
  private_link_private_link_target_id = azurerm_storage_account.storage_account.id

  weight = var.weight

  #cdn frontdoor endpoint
  frontdoor_endpoint_name = var.frontdoor_endpoint_name
  endpoint_enabled        = var.endpoint_enabled
  frontdoor_endpoint_tags = var.frontdoor_endpoint_tags

  #cdn frontdoor rule set
  frontdoor_rule_set_name = var.frontdoor_rule_set_name

  #cdn frontdoor rule
  frontdoor_rule_name       = var.frontdoor_rule_name
  cdn_frontdoor_rule_set_id = module.cdn_frontdoor_rule_set_module.frontdoor_rule_set_id
  order                     = var.order
  behavior_on_match         = var.behavior_on_match

  url_rewrite_action_config  = var.url_rewrite_action_config
  url_redirect_action_config = var.url_redirect_action_config
  route_configuration_override_action_config = {
    cache_duration                = var.route_configuration_override_action_config.cache_duration
    cdn_frontdoor_origin_group_id = module.cdn_frontdoor_origin_group_module.frontdoor_origin_group_id
    forwarding_protocol           = var.route_configuration_override_action_config.forwarding_protocol
    query_string_caching_behavior = var.route_configuration_override_action_config.query_string_caching_behavior
    query_string_parameters       = var.route_configuration_override_action_config.query_string_parameters
    compression_enabled           = var.route_configuration_override_action_config.compression_enabled
    cache_behavior                = var.route_configuration_override_action_config.cache_behavior
  }
  request_header_action_config  = var.request_header_action_config
  response_header_action_config = var.response_header_action_config

  remote_address_condition_config     = var.remote_address_condition_config
  request_method_condition_config     = var.request_method_condition_config
  query_string_condition_config       = var.query_string_condition_config
  post_args_condition_config          = var.post_args_condition_config
  request_uri_condition_config        = var.request_uri_condition_config
  request_header_condition_config     = var.request_header_condition_config
  request_body_condition_config       = var.request_body_condition_config
  request_scheme_condition_config     = var.request_scheme_condition_config
  url_path_condition_config           = var.url_path_condition_config
  url_file_extension_condition_config = var.url_file_extension_condition_config
  url_filename_condition_config       = var.url_filename_condition_config
  http_version_condition_config       = var.http_version_condition_config
  cookies_condition_config            = var.cookies_condition_config
  is_device_condition_config          = var.is_device_condition_config
  socket_address_condition_config     = var.socket_address_condition_config
  client_port_condition_config        = var.client_port_condition_config
  server_port_condition_config        = var.server_port_condition_config
  host_name_condition_config          = var.host_name_condition_config
  ssl_protocol_condition_config       = var.ssl_protocol_condition_config
}
```
<!-- END_TF_DOCS -->
