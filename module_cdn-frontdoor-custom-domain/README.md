<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 15/12/2022
## Introduction

Manages a Front Door (standard/premium) Custom Domain.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)
2. DNS Zone. If not already existing, we can use the dns zone creation module:
   [module_DNSZone_Creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_DNSZone_Creation&version=GBdevelop)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| <a name="module_cdn_frontdoor_profile_module"></a> [cdn\_frontdoor\_profile\_module](#module\_cdn\_frontdoor\_profile\_module) | ../../modules/module_cdn-frontdoor-profile | n/a |
| <a name="module_cdn_frontdoor_custom_domain_module"></a> [cdn\_frontdoor\_custom\_domain\_module](#module\_cdn\_frontdoor\_custom\_domain\_module) | ../../modules/module_cdn-frontdoor-custom-domain | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_custom_domain.frontdoor_custom_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_custom_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile. Changing this forces a new Front Door Profile to be created. | `string` | n/a | yes |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the Azure DNS Zone which should be used for this Front Door Custom Domain. If you are using Azure to host your DNS domains, you must delegate the domain provider's domain name system (DNS) to an Azure DNS Zone. | `string` | n/a | yes |
| <a name="input_frontdoor_custom_domain_name"></a> [frontdoor\_custom\_domain\_name](#input\_frontdoor\_custom\_domain\_name) | The name which should be used for this Front Door Custom Domain. Possible values must be between 2 and 260 characters in length, must begin with a letter or number, end with a letter or number and contain only letters, numbers and hyphens. Changing this forces a new Front Door Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_host_name"></a> [host\_name](#input\_host\_name) | The host name of the domain. The host\_name field must be the FQDN of your domain(e.g. contoso.fabrikam.com). Changing this forces a new Front Door Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_tls_cdn_frontdoor_secret_id"></a> [tls\_cdn\_frontdoor\_secret\_id](#input\_tls\_cdn\_frontdoor\_secret\_id) | Resource ID of the Front Door Secret. | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | Defines the source of the SSL certificate. Possible values include CustomerCertificate and ManagedCertificate. | `string` | `"ManagedCertificate"` | no |
| <a name="input_tls_minimum_tls_version"></a> [tls\_minimum\_tls\_version](#input\_tls\_minimum\_tls\_version) | TLS protocol version that will be used for Https. Possible values include TLS10 and TLS12. | `string` | `"TLS12"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_custom_domain_expiration_date"></a> [frontdoor\_custom\_domain\_expiration\_date](#output\_frontdoor\_custom\_domain\_expiration\_date) | The date time that the token expires. |
| <a name="output_frontdoor_custom_domain_id"></a> [frontdoor\_custom\_domain\_id](#output\_frontdoor\_custom\_domain\_id) | The ID of the Front Door Custom Domain. |
| <a name="output_frontdoor_custom_domain_validation_token"></a> [frontdoor\_custom\_domain\_validation\_token](#output\_frontdoor\_custom\_domain\_validation\_token) | The date time that the token expires. |

## Module Usage

```
resource "azurerm_dns_zone" "dns_zone" {
  name                = "sub-domain.domain.com"
  resource_group_name = var.resource_group_name
}

module "cdn_frontdoor_profile_module" {
  source = "../../modules/module_cdn-frontdoor-profile"

  resource_group_name        = var.resource_group_name
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags
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
```
<!-- END_TF_DOCS -->