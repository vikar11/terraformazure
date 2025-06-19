<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/12/2022
## Introduction

Manages a Front Door (standard/premium) Security Policy.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

NOTE:
1. The number of domain blocks that maybe included in the configuration file varies depending on the sku_name field of the linked Front Door Profile. The Standard_AzureFrontDoor sku may contain up to 100 domain blocks and a Premium_AzureFrontDoor sku may contain up to 500 domain blocks.

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
| <a name="module_cdn_frontdoor_firewall_policy_module"></a> [cdn\_frontdoor\_firewall\_policy\_module](#module\_cdn\_frontdoor\_firewall\_policy\_module) | ../../modules/module_cdn-frontdoor-firewall-policy | n/a |
| <a name="module_cdn_frontdoor_custom_domain_module"></a> [cdn\_frontdoor\_custom\_domain\_module](#module\_cdn\_frontdoor\_custom\_domain\_module) | ../../modules/module_cdn-frontdoor-custom-domain | n/a |
| <a name="module_cdn_frontdoor_security_policy_module"></a> [cdn\_frontdoor\_security\_policy\_module](#module\_cdn\_frontdoor\_security\_policy\_module) | ../../modules/module_cdn-frontdoor-security-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_firewall_policy.frontdoor_firewall_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_firewall_policy) | resource |
| [azurerm_cdn_frontdoor_custom_domain.frontdoor_custom_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_custom_domain) | resource |
| [azurerm_cdn_frontdoor_security_policy.frontdoor_security_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_security_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_domain_id"></a> [cdn\_frontdoor\_domain\_id](#input\_cdn\_frontdoor\_domain\_id) | The Resource Id of the Front Door Custom Domain or Front Door Endpoint that should be bound to this Front Door Security Policy. Changing this forces a new Front Door Security Policy to be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_firewall_policy_id"></a> [cdn\_frontdoor\_firewall\_policy\_id](#input\_cdn\_frontdoor\_firewall\_policy\_id) | The Resource Id of the Front Door Firewall Policy that should be linked to this Front Door Security Policy. Changing this forces a new Front Door Security Policy to be created. | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile. Changing this forces a new Front Door Profile to be created. | `string` | n/a | yes |
| <a name="input_custom_block_response_body"></a> [custom\_block\_response\_body](#input\_custom\_block\_response\_body) | If a custom\_rule block's action type is block, this is the response body. The body must be specified in base64 encoding. | `string` | n/a | yes |
| <a name="input_custom_block_response_status_code"></a> [custom\_block\_response\_status\_code](#input\_custom\_block\_response\_status\_code) | If a custom\_rule block's action type is block, this is the response status code. Possible values are 200, 403, 405, 406, or 429. | `string` | n/a | yes |
| <a name="input_custom_rule_action"></a> [custom\_rule\_action](#input\_custom\_rule\_action) | The action to perform when the rule is matched. Possible values are Allow, Block, Log, or Redirect. | `string` | n/a | yes |
| <a name="input_custom_rule_enabled"></a> [custom\_rule\_enabled](#input\_custom\_rule\_enabled) | Is the rule is enabled or disabled? | `bool` | `true` | no |
| <a name="input_custom_rule_match_condition_match_values"></a> [custom\_rule\_match\_condition\_match\_values](#input\_custom\_rule\_match\_condition\_match\_values) | Up to 600 possible values to match. Limit is in total across all match\_condition blocks and match\_values arguments. String value itself can be up to 256 characters in length. | `list(string)` | n/a | yes |
| <a name="input_custom_rule_match_condition_match_variable"></a> [custom\_rule\_match\_condition\_match\_variable](#input\_custom\_rule\_match\_condition\_match\_variable) | The request variable to compare with. Possible values are Cookies, PostArgs, QueryString, RemoteAddr, RequestBody, RequestHeader, RequestMethod, RequestUri, or SocketAddr. | `string` | n/a | yes |
| <a name="input_custom_rule_match_condition_negation_condition"></a> [custom\_rule\_match\_condition\_negation\_condition](#input\_custom\_rule\_match\_condition\_negation\_condition) | Should the result of the condition be negated. | `bool` | n/a | yes |
| <a name="input_custom_rule_match_condition_operator"></a> [custom\_rule\_match\_condition\_operator](#input\_custom\_rule\_match\_condition\_operator) | Comparison type to use for matching with the variable value. Possible values are Any, BeginsWith, Contains, EndsWith, Equal, GeoMatch, GreaterThan, GreaterThanOrEqual, IPMatch, LessThan, LessThanOrEqual or RegEx. | `string` | n/a | yes |
| <a name="input_custom_rule_match_condition_selector"></a> [custom\_rule\_match\_condition\_selector](#input\_custom\_rule\_match\_condition\_selector) | Match against a specific key if the match\_variable is QueryString, PostArgs, RequestHeader or Cookies. | `string` | n/a | yes |
| <a name="input_custom_rule_match_condition_transforms"></a> [custom\_rule\_match\_condition\_transforms](#input\_custom\_rule\_match\_condition\_transforms) | Up to 5 transforms to apply. Possible values are Lowercase, RemoveNulls, Trim, Uppercase, URLDecode or URLEncode. | `list(string)` | n/a | yes |
| <a name="input_custom_rule_name"></a> [custom\_rule\_name](#input\_custom\_rule\_name) | Gets name of the resource that is unique within a policy. This name can be used to access the resource. | `string` | n/a | yes |
| <a name="input_custom_rule_priority"></a> [custom\_rule\_priority](#input\_custom\_rule\_priority) | The priority of the rule. Rules with a lower value will be evaluated before rules with a higher value. | `number` | `1` | no |
| <a name="input_custom_rule_rate_limit_duration_in_minutes"></a> [custom\_rule\_rate\_limit\_duration\_in\_minutes](#input\_custom\_rule\_rate\_limit\_duration\_in\_minutes) | The rate limit duration in minutes. | `number` | `1` | no |
| <a name="input_custom_rule_rate_limit_threshold"></a> [custom\_rule\_rate\_limit\_threshold](#input\_custom\_rule\_rate\_limit\_threshold) | The rate limit threshold. | `number` | `10` | no |
| <a name="input_custom_rule_type"></a> [custom\_rule\_type](#input\_custom\_rule\_type) | The type of rule. Possible values are MatchRule or RateLimitRule. | `string` | n/a | yes |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the Azure DNS Zone which should be used for this Front Door Custom Domain. If you are using Azure to host your DNS domains, you must delegate the domain provider's domain name system (DNS) to an Azure DNS Zone. | `string` | n/a | yes |
| <a name="input_exclusion_match_variable"></a> [exclusion\_match\_variable](#input\_exclusion\_match\_variable) | The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames, RequestBodyJsonArgNames | `string` | n/a | yes |
| <a name="input_exclusion_operator"></a> [exclusion\_operator](#input\_exclusion\_operator) | Comparison operator to apply to the selector when specifying which elements in the collection this exclusion applies to. Possible values are: Equals, Contains, StartsWith, EndsWith, EqualsAny. | `string` | n/a | yes |
| <a name="input_exclusion_selector"></a> [exclusion\_selector](#input\_exclusion\_selector) | Selector for the value in the match\_variable attribute this exclusion applies to. | `string` | n/a | yes |
| <a name="input_frontdoor_custom_domain_name"></a> [frontdoor\_custom\_domain\_name](#input\_frontdoor\_custom\_domain\_name) | The name which should be used for this Front Door Custom Domain. Possible values must be between 2 and 260 characters in length, must begin with a letter or number, end with a letter or number and contain only letters, numbers and hyphens. Changing this forces a new Front Door Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_firewall_policy_enabled"></a> [frontdoor\_firewall\_policy\_enabled](#input\_frontdoor\_firewall\_policy\_enabled) | Is the Front Door Firewall Policy enabled? | `bool` | `true` | no |
| <a name="input_frontdoor_firewall_policy_mode"></a> [frontdoor\_firewall\_policy\_mode](#input\_frontdoor\_firewall\_policy\_mode) | The Front Door Firewall Policy mode. Possible values are Detection, Prevention. | `string` | `"Prevention"` | no |
| <a name="input_frontdoor_firewall_policy_name"></a> [frontdoor\_firewall\_policy\_name](#input\_frontdoor\_firewall\_policy\_name) | The name of the policy. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_frontdoor_firewall_policy_sku_name"></a> [frontdoor\_firewall\_policy\_sku\_name](#input\_frontdoor\_firewall\_policy\_sku\_name) | The sku's pricing tier for this Front Door Firewall Policy. Possible values include Standard\_AzureFrontDoor or Premium\_AzureFrontDoor. | `string` | n/a | yes |
| <a name="input_frontdoor_firewall_policy_tags"></a> [frontdoor\_firewall\_policy\_tags](#input\_frontdoor\_firewall\_policy\_tags) | A mapping of tags to assign to the Front Door Firewall Policy. | `map(string)` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_frontdoor_security_policy_name"></a> [frontdoor\_security\_policy\_name](#input\_frontdoor\_security\_policy\_name) | The name which should be used for this Front Door Security Policy. Possible values must not be an empty string. Changing this forces a new Front Door Security Policy to be created. | `string` | n/a | yes |
| <a name="input_host_name"></a> [host\_name](#input\_host\_name) | The host name of the domain. The host\_name field must be the FQDN of your domain(e.g. contoso.fabrikam.com). Changing this forces a new Front Door Custom Domain to be created. | `string` | n/a | yes |
| <a name="input_managed_rule_action"></a> [managed\_rule\_action](#input\_managed\_rule\_action) | The action to perform when the managed rule is matched. Possible values depends on which DRS version you are using, for DRS 1.0, 1.1 and preview-0.1 the possible values include Allow, Block, Log, or Redirect. For DRS 2.0 and 2.1 the value must be AnomalyScoring. | `string` | n/a | yes |
| <a name="input_managed_rule_override_rule_action"></a> [managed\_rule\_override\_rule\_action](#input\_managed\_rule\_override\_rule\_action) | The action to be applied when the rule matches. Possible values are Allow, Log, Block, Redirect and AnomalyScoring. | `string` | n/a | yes |
| <a name="input_managed_rule_override_rule_enabled"></a> [managed\_rule\_override\_rule\_enabled](#input\_managed\_rule\_override\_rule\_enabled) | Is the managed rule override enabled or disabled. | `bool` | `false` | no |
| <a name="input_managed_rule_override_rule_group_name"></a> [managed\_rule\_override\_rule\_group\_name](#input\_managed\_rule\_override\_rule\_group\_name) | The managed rule group to override. | `string` | n/a | yes |
| <a name="input_managed_rule_override_rule_rule_id"></a> [managed\_rule\_override\_rule\_rule\_id](#input\_managed\_rule\_override\_rule\_rule\_id) | Identifier for the managed rule. | `string` | n/a | yes |
| <a name="input_managed_rule_type"></a> [managed\_rule\_type](#input\_managed\_rule\_type) | The name of the managed rule to use with this resource. Possible values include DefaultRuleSet, Microsoft\_DefaultRuleSet, BotProtection or Microsoft\_BotManagerRuleSet. | `string` | n/a | yes |
| <a name="input_managed_rule_version"></a> [managed\_rule\_version](#input\_managed\_rule\_version) | The version of the managed rule to use with this resource. Possible values depends on which DRS type you are using, for the DefaultRuleSet type the possible values include 1.0 or preview-0.1. For Microsoft\_DefaultRuleSet the possible values include 1.1, 2.0 or 2.1. For BotProtection the value must be preview-0.1 and for Microsoft\_BotManagerRuleSet the value must be 1.0. | `string` | n/a | yes |
| <a name="input_patterns_to_match"></a> [patterns\_to\_match](#input\_patterns\_to\_match) | The list of paths to match for this firewall policy. Possible value includes /*. Changing this forces a new Front Door Security Policy to be created. | `list(string)` | n/a | yes |
| <a name="input_redirect_url"></a> [redirect\_url](#input\_redirect\_url) | If action type is redirect, this field represents redirect URL for the client. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_tls_cdn_frontdoor_secret_id"></a> [tls\_cdn\_frontdoor\_secret\_id](#input\_tls\_cdn\_frontdoor\_secret\_id) | Resource ID of the Front Door Secret. | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | Defines the source of the SSL certificate. Possible values include CustomerCertificate and ManagedCertificate. | `string` | `"ManagedCertificate"` | no |
| <a name="input_tls_minimum_tls_version"></a> [tls\_minimum\_tls\_version](#input\_tls\_minimum\_tls\_version) | TLS protocol version that will be used for Https. Possible values include TLS10 and TLS12. | `string` | `"TLS12"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_security_policy_id"></a> [frontdoor\_security\_policy\_id](#output\_frontdoor\_security\_policy\_id) | The ID of the Front Door Security Policy. |

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

module "cdn_frontdoor_firewall_policy_module" {
  source = "../../modules/module_cdn-frontdoor-firewall-policy"

  depends_on = [
    module.cdn_frontdoor_profile_module
  ]

  resource_group_name = var.resource_group_name

  #cdn profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn firewall policy
  frontdoor_firewall_policy_name     = var.frontdoor_firewall_policy_name
  frontdoor_firewall_policy_sku_name = var.frontdoor_firewall_policy_sku_name
  frontdoor_firewall_policy_enabled  = var.frontdoor_firewall_policy_enabled
  frontdoor_firewall_policy_mode     = var.frontdoor_firewall_policy_mode
  redirect_url                       = var.redirect_url

  custom_rule_name                               = var.custom_rule_name
  custom_rule_action                             = var.custom_rule_action
  custom_rule_enabled                            = var.custom_rule_enabled
  custom_rule_priority                           = var.custom_rule_priority
  custom_rule_type                               = var.custom_rule_type
  custom_rule_match_condition_match_variable     = var.custom_rule_match_condition_match_variable
  custom_rule_match_condition_match_values       = var.custom_rule_match_condition_match_values
  custom_rule_match_condition_operator           = var.custom_rule_match_condition_operator
  custom_rule_match_condition_selector           = var.custom_rule_match_condition_selector
  custom_rule_match_condition_negation_condition = var.custom_rule_match_condition_negation_condition
  custom_rule_match_condition_transforms         = var.custom_rule_match_condition_transforms
  custom_rule_rate_limit_duration_in_minutes     = var.custom_rule_rate_limit_duration_in_minutes
  custom_rule_rate_limit_threshold               = var.custom_rule_rate_limit_threshold
  custom_block_response_status_code              = var.custom_block_response_status_code
  custom_block_response_body                     = var.custom_block_response_body

  managed_rule_type                     = var.managed_rule_type
  managed_rule_version                  = var.managed_rule_version
  managed_rule_action                   = var.managed_rule_action
  managed_rule_override_rule_group_name = var.managed_rule_override_rule_group_name

  managed_rule_override_rule_rule_id = var.managed_rule_override_rule_rule_id
  managed_rule_override_rule_action  = var.managed_rule_override_rule_action
  managed_rule_override_rule_enabled = var.managed_rule_override_rule_enabled

  exclusion_match_variable = var.exclusion_match_variable
  exclusion_operator       = var.exclusion_operator
  exclusion_selector       = var.exclusion_selector

  frontdoor_firewall_policy_tags = var.frontdoor_firewall_policy_tags
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
  //cdn_frontdoor_profile_id = var.cdn_frontdoor_profile_id
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  host_name                = var.host_name
  //dns_zone_id = var.dns_zone_id
  dns_zone_id                 = azurerm_dns_zone.dns_zone.id
  tls_certificate_type        = var.tls_certificate_type
  tls_minimum_tls_version     = var.tls_minimum_tls_version
  tls_cdn_frontdoor_secret_id = var.tls_cdn_frontdoor_secret_id
}

module "cdn_frontdoor_security_policy_module" {
  source = "../../modules/module_cdn-frontdoor-security-policy"

  depends_on = [
    azurerm_dns_zone.dns_zone,
    module.cdn_frontdoor_profile_module,
    module.cdn_frontdoor_firewall_policy_module,
    module.cdn_frontdoor_custom_domain_module
  ]
  resource_group_name = var.resource_group_name

  #cdn profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #cdn firewall policy
  frontdoor_firewall_policy_name     = var.frontdoor_firewall_policy_name
  frontdoor_firewall_policy_sku_name = var.frontdoor_firewall_policy_sku_name
  frontdoor_firewall_policy_enabled  = var.frontdoor_firewall_policy_enabled
  frontdoor_firewall_policy_mode     = var.frontdoor_firewall_policy_mode
  redirect_url                       = var.redirect_url

  custom_rule_name                               = var.custom_rule_name
  custom_rule_action                             = var.custom_rule_action
  custom_rule_enabled                            = var.custom_rule_enabled
  custom_rule_priority                           = var.custom_rule_priority
  custom_rule_type                               = var.custom_rule_type
  custom_rule_match_condition_match_variable     = var.custom_rule_match_condition_match_variable
  custom_rule_match_condition_match_values       = var.custom_rule_match_condition_match_values
  custom_rule_match_condition_operator           = var.custom_rule_match_condition_operator
  custom_rule_match_condition_selector           = var.custom_rule_match_condition_selector
  custom_rule_match_condition_negation_condition = var.custom_rule_match_condition_negation_condition
  custom_rule_match_condition_transforms         = var.custom_rule_match_condition_transforms
  custom_rule_rate_limit_duration_in_minutes     = var.custom_rule_rate_limit_duration_in_minutes
  custom_rule_rate_limit_threshold               = var.custom_rule_rate_limit_threshold
  custom_block_response_status_code              = var.custom_block_response_status_code
  custom_block_response_body                     = var.custom_block_response_body

  managed_rule_type                     = var.managed_rule_type
  managed_rule_version                  = var.managed_rule_version
  managed_rule_action                   = var.managed_rule_action
  managed_rule_override_rule_group_name = var.managed_rule_override_rule_group_name

  managed_rule_override_rule_rule_id = var.managed_rule_override_rule_rule_id
  managed_rule_override_rule_action  = var.managed_rule_override_rule_action
  managed_rule_override_rule_enabled = var.managed_rule_override_rule_enabled

  exclusion_match_variable = var.exclusion_match_variable
  exclusion_operator       = var.exclusion_operator
  exclusion_selector       = var.exclusion_selector

  frontdoor_firewall_policy_tags = var.frontdoor_firewall_policy_tags

  #cdn custom domain
  frontdoor_custom_domain_name = var.frontdoor_custom_domain_name
  cdn_frontdoor_profile_id = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  host_name                = var.host_name
  dns_zone_id                 = azurerm_dns_zone.dns_zone.id
  tls_certificate_type        = var.tls_certificate_type
  tls_minimum_tls_version     = var.tls_minimum_tls_version
  tls_cdn_frontdoor_secret_id = var.tls_cdn_frontdoor_secret_id

  #cdn security policy
  frontdoor_security_policy_name = var.frontdoor_security_policy_name
  cdn_frontdoor_firewall_policy_id = module.cdn_frontdoor_firewall_policy_module.frontdoor_firewall_policy_id
  cdn_frontdoor_domain_id = module.cdn_frontdoor_custom_domain_module.frontdoor_custom_domain_id
  patterns_to_match       = var.patterns_to_match
}
```
<!-- END_TF_DOCS -->