<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/12/2022
## Introduction

Manages a Front Door (standard/premium) Origin Group.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

NOTE:
1. Health probes can only be disabled if there is a single enabled origin in a single enabled origin group. For more information about the health_probe settings please see the product documentation.

## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| <a name="module_cdn_frontdoor_profile_module"></a> [cdn\_frontdoor\_profile\_module](#module\_cdn\_frontdoor\_profile\_module) | ../../modules/module_cdn-frontdoor-profile | n/a |
| <a name="module_cdn_frontdoor_origin_group_module"></a> [cdn\_frontdoor\_origin\_group\_module](#module\_cdn\_frontdoor\_origin\_group\_module) | ../../modules/module_cdn-frontdoor-origin-group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile within which this Front Door Endpoint should exist. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_origin_group_name"></a> [frontdoor\_origin\_group\_name](#input\_frontdoor\_origin\_group\_name) | The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_health_probe_interval_in_seconds"></a> [health\_probe\_interval\_in\_seconds](#input\_health\_probe\_interval\_in\_seconds) | Specifies the number of seconds between health probes. Possible values are between 5 and 31536000 seconds (inclusive). | `number` | n/a | yes |
| <a name="input_health_probe_path"></a> [health\_probe\_path](#input\_health\_probe\_path) | Specifies the path relative to the origin that is used to determine the health of the origin. | `string` | `"/"` | no |
| <a name="input_health_probe_protocol"></a> [health\_probe\_protocol](#input\_health\_probe\_protocol) | Specifies the protocol to use for health probe. Possible values are Http and Https. | `string` | n/a | yes |
| <a name="input_health_probe_request_type"></a> [health\_probe\_request\_type](#input\_health\_probe\_request\_type) | Specifies the type of health probe request that is made. Possible values are GET and HEAD. | `string` | `"HEAD"` | no |
| <a name="input_load_balancing_additional_latency_in_milliseconds"></a> [load\_balancing\_additional\_latency\_in\_milliseconds](#input\_load\_balancing\_additional\_latency\_in\_milliseconds) | Specifies the additional latency in milliseconds for probes to fall into the lowest latency bucket. Possible values are between 0 and 1000 seconds (inclusive). | `number` | `50` | no |
| <a name="input_load_balancing_sample_size"></a> [load\_balancing\_sample\_size](#input\_load\_balancing\_sample\_size) | Specifies the number of samples to consider for load balancing decisions. Possible values are between 0 and 255 (inclusive). | `number` | `4` | no |
| <a name="input_load_balancing_successful_samples_required"></a> [load\_balancing\_successful\_samples\_required](#input\_load\_balancing\_successful\_samples\_required) | Specifies the number of samples within the sample period that must succeed. Possible values are between 0 and 255 (inclusive). | `number` | `3` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_restore_traffic_time_to_healed_or_new_endpoint_in_minutes"></a> [restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes](#input\_restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes) | Specifies the amount of time which should elapse before shifting traffic to another endpoint when a healthy endpoint becomes unhealthy or a new endpoint is added. Possible values are between 0 and 50 minutes (inclusive). | `number` | `10` | no |
| <a name="input_session_affinity_enabled"></a> [session\_affinity\_enabled](#input\_session\_affinity\_enabled) | Specifies whether session affinity should be enabled on this host. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_origin_group_id"></a> [frontdoor\_origin\_group\_id](#output\_frontdoor\_origin\_group\_id) | The ID of the Front Door Origin Group. |

## Module Usage

```
module "cdn_frontdoor_profile_module" {
  source = "../../modules/module_cdn-frontdoor-profile"

  resource_group_name        = var.resource_group_name
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags
}

module "cdn_frontdoor_origin_group_module" {
  source = "../../modules/module_cdn-frontdoor-origin-group"

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
```
<!-- END_TF_DOCS -->