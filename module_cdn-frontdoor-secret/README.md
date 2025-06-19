<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/12/2022
## Introduction

Manages a Front Door (standard/premium) Secret.

## File Structure 

This particular module is having the following configuration files.
- cdn.tf : This file is having the terraform code to provision the resource as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cdn.tf
- outputs.tf : This file will be having the resource output details generated.

NOTE:
1. You must add an Access Policy to your azurerm_key_vault for the Microsoft.Azure.Cdn Enterprise Application Object ID.
2. You only need to add the Access Policy for your personal AAD Object ID if you are planning to view the secrets via the Azure Portal.
3. If you would like to use the latest version of the Key Vault Certificate use the Key Vault Certificates versionless_id attribute as the key_vault_certificate_id fields value

## Requirements

1. Resource group. If not already existing, we can use the resource group creation module:
   [module_resource-group-creation](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_resource-group-creation)
2. Key vault. If not already existing, we can use the key vault creation module:
   [module_keyvault](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?path=/modules/module_keyvault)
3. Key vault access policies. If not already existing, we can use the key vault access policy creation module:
   [module_keyvault_access_policies](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?version=GBdevelop&path=/modules/module_keyvault_access_policies)
4. Key vault certificate. If not already existing, we can use the key vault certificate creation module:
   [module_keyvault_certificate](https://dev.azure.com/EYFSDigitalEngineering/EY%20-%20Cloud%20Infrastructure%20Library%20(CIL)/_git/Azure_CIL?version=GBdevelop&path=/modules/module_keyvault_certificate)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| <a name="module_cdn_frontdoor_profile_module"></a> [cdn\_frontdoor\_profile\_module](#module\_cdn\_frontdoor\_profile\_module) | ../../modules/module_cdn-frontdoor-profile | n/a |
| <a name="module_keyvault_module"></a> [keyvault\_module](#module\_keyvault\_module) | ../../modules/module_keyvault | n/a |
| <a name="module_keyvault_access_policies_module"></a> [keyvault\_access\_policies\_module](#module\_keyvault\_access\_policies\_module) | ../../modules/module_keyvault_access_policies | n/a |
| <a name="module_keyvault_certificate_module"></a> [keyvault\_certificate\_module](#module\_keyvault\_certificate\_module) | ../../modules/modules/module_keyvault_certificate | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_frontdoor_profile.frontdoor_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_certificate.certificate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_certificate) | resource |
| [azurerm_cdn_frontdoor_secret.frontdoor_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | The object ID of an Application in Azure Active Directory. | `string` | n/a | yes |
| <a name="input_application_id1"></a> [application\_id1](#input\_application\_id1) | The object ID of an Application in Azure Active Directory. | `string` | n/a | yes |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Specifies which traffic can bypass the network rules. Possible values are AzureServices and None | `string` | n/a | yes |
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The Resource ID of the Front Door Profile. Changing this forces a new Front Door Secret to be created. | `string` | n/a | yes |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | contents - (Required) The base64-encoded certificate contents. password - (Optional) The password associated with the certificate. Changing this forces a new resource to be created. | <pre>object({<br>    //contents = string<br>    password = string<br>  })</pre> | n/a | yes |
| <a name="input_certificate_permissions1"></a> [certificate\_permissions1](#input\_certificate\_permissions1) | List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update. | `list(string)` | <pre>[<br>  "Backup",<br>  "Create",<br>  "Delete",<br>  "DeleteIssuers",<br>  "Get",<br>  "GetIssuers",<br>  "Import",<br>  "List",<br>  "ListIssuers",<br>  "ManageContacts",<br>  "ManageIssuers",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "SetIssuers",<br>  "Update"<br>]</pre> | no |
| <a name="input_certificate_policy"></a> [certificate\_policy](#input\_certificate\_policy) | issuer\_parameters:name - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). key\_properties: curve - (Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key\_type is EC or EC-HSM. exportable - (Required) Is this certificate exportable? Changing this forces a new resource to be created. key\_size - (Optional) The size of the key used in the certificate. Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys. This property is required when using RSA keys. key\_type - (Required) Specifies the type of key, such as RSA or EC. reuse\_key - (Required) Is the key reusable? lifetime\_action: action\_type - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. days\_before\_expiry - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. lifetime\_percentage - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run. | <pre>list(object({<br>    issuer_parameters_name = string<br>    curve                  = string<br>    exportable             = string<br>    key_size               = string<br>    key_type               = string<br>    reuse_key              = string<br>    content_type           = string<br>    lifetime_action = list(object({<br>      action_type         = string<br>      days_before_expiry  = string<br>      lifetime_percentage = number<br>    }))<br>    x509_certificate_properties = list(object({<br>      extended_key_usage = list(string)<br>      key_usage          = list(string)<br>      subject            = string<br>      validity_in_months = string<br>      subject_alternative_names = list(object({<br>        dns_names = list(string)<br>        emails    = list(string)<br>        upns      = list(string)<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_certificate_tags"></a> [certificate\_tags](#input\_certificate\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_contact_email"></a> [contact\_email](#input\_contact\_email) | E-mail address of the contact. | `string` | n/a | yes |
| <a name="input_contact_name"></a> [contact\_name](#input\_contact\_name) | Name of the contact. | `string` | n/a | yes |
| <a name="input_contact_phone"></a> [contact\_phone](#input\_contact\_phone) | Phone number of the contact. | `string` | n/a | yes |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. Possible values are Allow and Deny. | `string` | n/a | yes |
| <a name="input_enable_access_policy"></a> [enable\_access\_policy](#input\_enable\_access\_policy) | Want to add access policy? | `bool` | n/a | yes |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false. | `bool` | n/a | yes |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false. | `bool` | n/a | yes |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false. | `bool` | n/a | yes |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false. | `bool` | n/a | yes |
| <a name="input_frontdoor_profile_name"></a> [frontdoor\_profile\_name](#input\_frontdoor\_profile\_name) | Specifies the name of the CDN Frotndoor Profile | `string` | n/a | yes |
| <a name="input_frontdoor_profile_sku_name"></a> [frontdoor\_profile\_sku\_name](#input\_frontdoor\_profile\_sku\_name) | The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard\_Akamai, Standard\_ChinaCdn, Standard\_Microsoft, Standard\_Verizon or Premium\_Verizon. | `string` | n/a | yes |
| <a name="input_frontdoor_profile_tags"></a> [frontdoor\_profile\_tags](#input\_frontdoor\_profile\_tags) | A mapping of tags to assign to the CDN Frotndoor Profile | `map(string)` | n/a | yes |
| <a name="input_frontdoor_secret_name"></a> [frontdoor\_secret\_name](#input\_frontdoor\_secret\_name) | The name which should be used for this Front Door Secret. Possible values must start with a letter or a number, only contain letters, numbers and hyphens and have a length of between 2 and 260 characters. Changing this forces a new Front Door Secret to be created | `string` | n/a | yes |
| <a name="input_generate_certificate"></a> [generate\_certificate](#input\_generate\_certificate) | Wants to generate a certificate? | `bool` | n/a | yes |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault | `list(string)` | n/a | yes |
| <a name="input_key_permissions1"></a> [key\_permissions1](#input\_key\_permissions1) | List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy. | `list(string)` | <pre>[<br>  "Backup",<br>  "Create",<br>  "Decrypt",<br>  "Delete",<br>  "Encrypt",<br>  "Get",<br>  "Import",<br>  "List",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "Sign",<br>  "UnwrapKey",<br>  "Update",<br>  "Verify",<br>  "WrapKey",<br>  "Release",<br>  "Rotate",<br>  "GetRotationPolicy",<br>  "SetRotationPolicy"<br>]</pre> | no |
| <a name="input_key_vault_certificate_id"></a> [key\_vault\_certificate\_id](#input\_key\_vault\_certificate\_id) | The ID of the Key Vault certificate resource to use. Changing this forces a new Front Door Secret to be created. | `string` | n/a | yes |
| <a name="input_key_vault_resource_group_name"></a> [key\_vault\_resource\_group\_name](#input\_key\_vault\_resource\_group\_name) | rg of key vault | `string` | n/a | yes |
| <a name="input_keyvault_certificate"></a> [keyvault\_certificate](#input\_keyvault\_certificate) | Specifies the name of the Key Vault Certificate. | `string` | n/a | yes |
| <a name="input_keyvault_certificate_permissions"></a> [keyvault\_certificate\_permissions](#input\_keyvault\_certificate\_permissions) | List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update. | `list(string)` | n/a | yes |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | The ID of the Key Vault where the Certificate should be created. | `string` | n/a | yes |
| <a name="input_keyvault_key_permissions"></a> [keyvault\_key\_permissions](#input\_keyvault\_key\_permissions) | List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify, WrapKey, Release, Rotate, GetRotationPolicy, and SetRotationPolicy. | `list(string)` | n/a | yes |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | Specifies the name of the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_keyvault_secret_permissions"></a> [keyvault\_secret\_permissions](#input\_keyvault\_secret\_permissions) | List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set. | `list(string)` | n/a | yes |
| <a name="input_keyvault_storage_permissions"></a> [keyvault\_storage\_permissions](#input\_keyvault\_storage\_permissions) | List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update. | `list(string)` | n/a | yes |
| <a name="input_keyvault_tags"></a> [keyvault\_tags](#input\_keyvault\_tags) | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |
| <a name="input_kv_sku"></a> [kv\_sku](#input\_kv\_sku) | The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of RG | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this Key Vault. Defaults to true. | `bool` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Purge Protection enabled for this Key Vault? Defaults to false. | `bool` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_secret_permissions1"></a> [secret\_permissions1](#input\_secret\_permissions1) | List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set. | `list(string)` | <pre>[<br>  "Backup",<br>  "Delete",<br>  "Get",<br>  "List",<br>  "Purge",<br>  "Recover",<br>  "Restore",<br>  "Set"<br>]</pre> | no |
| <a name="input_service_principal_object_id"></a> [service\_principal\_object\_id](#input\_service\_principal\_object\_id) | SP Object id | `string` | n/a | yes |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days. | `number` | n/a | yes |
| <a name="input_storage_permissions1"></a> [storage\_permissions1](#input\_storage\_permissions1) | List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update. | `list(string)` | <pre>[<br>  "Backup",<br>  "Delete",<br>  "DeleteSAS",<br>  "Get",<br>  "GetSAS",<br>  "List",<br>  "ListSAS",<br>  "Purge",<br>  "Recover",<br>  "RegenerateKey",<br>  "Restore",<br>  "Set",<br>  "SetSAS",<br>  "Update"<br>]</pre> | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet IDs which should be able to access this Key Vault. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_secret_id"></a> [frontdoor\_secret\_id](#output\_frontdoor\_secret\_id) | The ID of the Front Door Secret. |

## Module Usage

```
data "azurerm_client_config" "config" {
}

/*data "azuread_service_principal" "frontdoor" {
  display_name = "Microsoft.AzureFrontDoor-Cdn"
}*/

module "cdn_frontdoor_profile_module" {
  source = "../../modules/module_cdn-frontdoor-profile"

  resource_group_name        = var.resource_group_name
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags
}

module "keyvault_module" {
  source = "../../modules/module_keyvault"

  keyvault_name                   = var.keyvault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = data.azurerm_client_config.config.tenant_id //var.tenant_id
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
  tags                            = var.keyvault_tags
  enable_access_policy            = var.enable_access_policy
  object_id                       = data.azurerm_client_config.config.object_id //var.object_id
  //object_id                        = data.azuread_service_principal.frontdoor.object_id
  //object_id = var.service_principal_object_id
  application_id                   = var.application_id
  keyvault_key_permissions         = var.keyvault_key_permissions
  keyvault_secret_permissions      = var.keyvault_secret_permissions
  keyvault_certificate_permissions = var.keyvault_certificate_permissions
  keyvault_storage_permissions     = var.keyvault_storage_permissions

}

module "keyvault_access_policies_module" {
  depends_on = [
    module.keyvault_module
  ]
  source      = "../../modules/module_keyvault_access_policies"
  keyvault_id = module.keyvault_module.keyvault_id
  //tenant_id               = lookup(each.value, "tenant_id")
  tenant_id = data.azurerm_client_config.config.tenant_id
  //object_id               = lookup(each.value, "object_id")
  //object_id = data.azuread_service_principal.frontdoor.object_id
  object_id = var.service_principal_object_id
  //application_id          = lookup(each.value, "application_id")
  application_id          = var.application_id1
  key_permissions         = var.key_permissions1
  secret_permissions      = var.secret_permissions1
  certificate_permissions = var.certificate_permissions1
  storage_permissions     = var.storage_permissions1
}

module "keyvault_certificate_module" {
  source               = "../../modules/module_keyvault_certificate"
  keyvault_certificate = var.keyvault_certificate
  keyvault_id          = module.keyvault_module.keyvault_id
  generate_certificate = var.generate_certificate
  certificate          = var.certificate
  certificate_policy   = var.certificate_policy
  tags                 = var.certificate_tags
}

module "frontdoor_secret_module" {
  source = "../../modules/module_cdn-frontdoor-secret"

  depends_on = [
    module.keyvault_module,
    module.keyvault_access_policies_module,
    module.keyvault_certificate_module,
    module.cdn_frontdoor_profile_module
  ]

  resource_group_name = var.resource_group_name
  location            = var.location

  #cdn profile
  frontdoor_profile_name     = var.frontdoor_profile_name
  frontdoor_profile_sku_name = var.frontdoor_profile_sku_name
  frontdoor_profile_tags     = var.frontdoor_profile_tags

  #keyvault
  keyvault_name = var.keyvault_name
  //tenant_id                       = data.azurerm_client_config.config.tenant_id //var.tenant_id
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
  //object_id                       = data.azurerm_client_config.config.object_id //var.object_id
  //object_id = data.azuread_service_principal.frontdoor.object_id
  application_id                   = var.application_id
  keyvault_key_permissions         = var.keyvault_key_permissions
  keyvault_secret_permissions      = var.keyvault_secret_permissions
  keyvault_certificate_permissions = var.keyvault_certificate_permissions
  keyvault_storage_permissions     = var.keyvault_storage_permissions

  #keyvault_access_policies
  application_id1          = var.application_id1
  key_permissions1         = var.key_permissions1
  secret_permissions1      = var.secret_permissions1
  certificate_permissions1 = var.certificate_permissions1
  storage_permissions1     = var.storage_permissions1

  #keyvault certificate
  keyvault_certificate = var.keyvault_certificate
  keyvault_id          = module.keyvault_module.keyvault_id
  generate_certificate = var.generate_certificate
  certificate          = var.certificate
  certificate_policy   = var.certificate_policy
  certificate_tags                 = var.certificate_tags

  #cdn frontdoor secret
  frontdoor_secret_name         = var.frontdoor_secret_name
  cdn_frontdoor_profile_id      = module.cdn_frontdoor_profile_module.frontdoor_profile_id
  //key_vault_certificate_id      = var.key_vault_certificate_id
  key_vault_certificate_id = module.keyvault_certificate_module.certificate_id
  //key_vault_resource_group_name = var.key_vault_resource_group_name
  key_vault_resource_group_name = var.resource_group_name

  service_principal_object_id = var.service_principal_object_id
}
```
<!-- END_TF_DOCS -->