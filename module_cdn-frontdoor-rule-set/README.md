<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 15/12/2022
## Introduction

Manages a Front Door (standard/premium) Rule Set.

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
| <a name="module_cdn_frontdoor_rule_set_module"></a> [cdn\_frontdoor\_rule\_set\_module](#module\_cdn\_frontdoor\_rule\_set\_module) | ../../modules/module_cdn-frontdoor-rule-set | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_rule_set.frontdoor_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile. Changing this forces a new Front Door Rule Set to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_frontdoor_rule_set_name"></a> [frontdoor\_rule\_set\_name](#input\_frontdoor\_rule\_set\_name) | The name which should be used for this Front Door Rule Set. Changing this forces a new Front Door Rule Set to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_rule_set_id"></a> [frontdoor\_rule\_set\_id](#output\_frontdoor\_rule\_set\_id) | The ID of the Front Door Rule Set. |

## Module Usage

```
module "cdn_frontdoor_profile_module" {
  source = "../../modules/module_cdn-frontdoor-profile"

  resource_group_name        = var.resource_group_name
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags
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
```
<!-- END_TF_DOCS -->