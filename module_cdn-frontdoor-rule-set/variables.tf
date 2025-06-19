## CDN Frontdoor Profile
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

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

#CDN Frontdoor Rule Set
variable "frontdoor_rule_set_name" {
  type        = string
  description = "The name which should be used for this Front Door Rule Set. Changing this forces a new Front Door Rule Set to be created."
}

variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The ID of the Front Door Profile. Changing this forces a new Front Door Rule Set to be created."
}