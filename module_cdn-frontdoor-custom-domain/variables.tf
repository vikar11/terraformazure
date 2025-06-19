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

##CDN Frontdoor Custom Domain
variable "frontdoor_custom_domain_name" {
  type        = string
  description = " The name which should be used for this Front Door Custom Domain. Possible values must be between 2 and 260 characters in length, must begin with a letter or number, end with a letter or number and contain only letters, numbers and hyphens. Changing this forces a new Front Door Custom Domain to be created."
}

variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The ID of the Front Door Profile. Changing this forces a new Front Door Profile to be created."
}

variable "host_name" {
  type        = string
  description = " The host name of the domain. The host_name field must be the FQDN of your domain(e.g. contoso.fabrikam.com). Changing this forces a new Front Door Custom Domain to be created."
}

variable "dns_zone_id" {
  type        = string
  description = "The ID of the Azure DNS Zone which should be used for this Front Door Custom Domain. If you are using Azure to host your DNS domains, you must delegate the domain provider's domain name system (DNS) to an Azure DNS Zone."
}

variable "tls_certificate_type" {
  type        = string
  description = "Defines the source of the SSL certificate. Possible values include CustomerCertificate and ManagedCertificate."
  default     = "ManagedCertificate"
}

variable "tls_minimum_tls_version" {
  type        = string
  description = " TLS protocol version that will be used for Https. Possible values include TLS10 and TLS12."
  default     = "TLS12"
}

variable "tls_cdn_frontdoor_secret_id" {
  type        = string
  description = "Resource ID of the Front Door Secret."
}

