<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 15/12/2022
## Introduction

Manages a Front Door (standard/premium) Endpoint.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| <a name="module_cdn_frontdoor_profile_module"></a> [cdn\_frontdoor\_profile\_module](#module\_cdn\_frontdoor\_profile\_module) | ../../modules/module_cdn-frontdoor-profile | n/a |
| <a name="module_cdn_frontdoor_endpoint_module"></a> [cdn\_frontdoor\_endpoint\_module](#module\_cdn\_frontdoor\_endpoint\_module) | ../../modules/module_cdn-frontdoor-endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile within which this Front Door Endpoint should exist. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_endpoint_enabled"></a> [endpoint\_enabled](#input\_endpoint\_enabled) | Specifies if this Front Door Endpoint is enabled? | `bool` | `true` | no |
| <a name="input_frontdoor_endpoint_name"></a> [frontdoor\_endpoint\_name](#input\_frontdoor\_endpoint\_name) | The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_endpoint_tags"></a> [frontdoor\_endpoint\_tags](#input\_frontdoor\_endpoint\_tags) | Specifies a mapping of tags which should be assigned to the Front Door Endpoint. | `map(string)` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_endpoint_host_name"></a> [frontdoor\_endpoint\_host\_name](#output\_frontdoor\_endpoint\_host\_name) | The host name of the Front Door Endpoint, in the format {endpointName}.{dnsZone} (for example, contoso.azureedge.net). |
| <a name="output_frontdoor_endpoint_id"></a> [frontdoor\_endpoint\_id](#output\_frontdoor\_endpoint\_id) | The ID of this Front Door Endpoint. |

## Module Usage

```
module "cdn_frontdoor_profile_module" {
  source = "../../modules/module_cdn-frontdoor-profile"

  resource_group_name    = var.resource_group_name
  frontdoor_profile_name = var.frontdoor_profile_name
  sku_name               = var.sku_name
  frontdoor_profile_tags = var.frontdoor_profile_tags
}

module "cdn_frontdoor_endpoint_module" {
  source = "../../modules/module_cdn-frontdoor-endpoint"

  resource_group_name = var.resource_group_name

  #cdn frontdoor profile
  frontdoor_profile_name = var.frontdoor_profile_name
  sku_name               = var.sku_name
  frontdoor_profile_tags = var.frontdoor_profile_tags

  #cdn frontdoor endpoint
  frontdoor_endpoint_name = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  endpoint_enabled         = var.endpoint_enabled
  frontdoor_endpoint_tags  = var.frontdoor_endpoint_tags
}
```
<!-- END_TF_DOCS -->