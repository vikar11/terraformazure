## CDN Frontdoor Profile
// variable "resource_group_name" {
//   type        = string
//   description = "The name of the resource group"
// }

variable "frontdoor_profile_name" {
  type        = string
  description = "Specifies the name of the CDN Frotndoor Profile"
}

variable "frontdoor_profile_sku_name" {
  type        = string
  description = "The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}

variable "frontdoor_profile_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the CDN Frotndoor Profile"
}

// variable "name" {
//   type        = string
//   description = "Name of the Front Door profile"
// }

// variable "sku_name" {
//   type        = string
//   description = "SKU name: Standard_AzureFrontDoor or Premium_AzureFrontDoor"
// }
