## CDN Frontdoor Profile
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "frontdoor_profile_sku_name" {
  type        = string
  description = "The pricing related information of current CDN Frotndoor Profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}

variable "frontdoor_profile_name" {
  type        = string
  description = "Specifies the name of the CDN Frotndoor Profile"
}

variable "frontdoor_profile_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the CDN Frotndoor Profile"
}


## CDN Frontdoor Origin Group
variable "frontdoor_origin_group_name" {
  type        = string
  description = "The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created."
}

variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The ID of the Front Door Profile within which this Front Door Endpoint should exist. Changing this forces a new Front Door Endpoint to be created."
}

variable "load_balancing_additional_latency_in_milliseconds" {
  type        = number
  description = "Specifies the additional latency in milliseconds for probes to fall into the lowest latency bucket. Possible values are between 0 and 1000 seconds (inclusive)."
  default     = 50
}

variable "load_balancing_sample_size" {
  type        = number
  description = "Specifies the number of samples to consider for load balancing decisions. Possible values are between 0 and 255 (inclusive)."
  default     = 4
}

variable "load_balancing_successful_samples_required" {
  type        = number
  description = "Specifies the number of samples within the sample period that must succeed. Possible values are between 0 and 255 (inclusive)."
  default     = 3
}

variable "health_probe_protocol" {
  type        = string
  description = " Specifies the protocol to use for health probe. Possible values are Http and Https."
}

variable "health_probe_interval_in_seconds" {
  type        = number
  description = "Specifies the number of seconds between health probes. Possible values are between 5 and 31536000 seconds (inclusive)."
}

variable "health_probe_request_type" {
  type        = string
  description = "Specifies the type of health probe request that is made. Possible values are GET and HEAD."
  default     = "HEAD"
}

variable "health_probe_path" {
  type        = string
  description = "Specifies the path relative to the origin that is used to determine the health of the origin."
  default     = "/"
}

variable "restore_traffic_time_to_healed_or_new_endpoint_in_minutes" {
  type        = number
  description = "Specifies the amount of time which should elapse before shifting traffic to another endpoint when a healthy endpoint becomes unhealthy or a new endpoint is added. Possible values are between 0 and 50 minutes (inclusive)."
  default     = 10
}

variable "session_affinity_enabled" {
  type        = bool
  description = "Specifies whether session affinity should be enabled on this host."
  default     = true
}


## CDN Frontdoor Origin
variable "frontdoor_origin_name" {
  type        = string
  description = "The name which should be used for this Front Door Origin. Changing this forces a new Front Door Origin to be created."
}

variable "resource_group_location" {
  type        = string
  description = "location of rg"
}
/*
variable "cdn_frontdoor_origin_group_id" {
  type = string
  description = " The ID of the Front Door Origin Group within which this Front Door Origin should exist. Changing this forces a new Front Door Origin to be created."
}*/

variable "host_name" {
  type        = string
  description = "The IPv4 address, IPv6 address or Domain name of the Origin."
}

variable "certificate_name_check_enabled" {
  type        = bool
  description = "Specifies whether certificate name checks are enabled for this origin."
}

variable "cdn_frontdoor_origin_enabled" {
  type        = bool
  description = "Should the origin be enabled? Possible values are true or false."
  default     = true
}

variable "http_port" {
  type        = number
  description = "The value of the HTTP port. Must be between 1 and 65535."
  default     = 80
}

variable "https_port" {
  type        = number
  description = "The value of the HTTPS port. Must be between 1 and 65535."
  default     = 443
}

variable "origin_host_header" {
  type        = string
  description = "The host header value (an IPv4 address, IPv6 address or Domain name) which is sent to the origin with each request. If unspecified the hostname from the request will be used."
}

variable "priority" {
  type        = number
  description = "Priority of origin in given origin group for load balancing. Higher priorities will not be used for load balancing if any lower priority origin is healthy. Must be between 1 and 5 (inclusive)."
  default     = 1
}

variable "private_link_request_message" {
  type        = string
  description = "Specifies the request message that will be submitted to the private_link_target_id when requesting the private link endpoint connection. Values must be between 1 and 140 characters in length. "
  default     = "Access request for Front Door Private Link Origin"
}

variable "private_link_target_type" {
  type        = string
  description = "Specifies the type of target for this Private Link Endpoint. Possible values are blob, blob_secondary, web and sites"
}

variable "private_link_location" {
  type        = string
  description = "Specifies the location where the Private Link resource should exist."
}

variable "private_link_private_link_target_id" {
  type        = string
  description = "The ID of the Azure Resource to connect to via the Private Link."
}

variable "weight" {
  type        = number
  description = "The weight of the origin in a given origin group for load balancing. Must be between 1 and 1000."
  default     = 500
}

##Storage Account
variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "storage_account_tier" {
  type        = string
  description = "STG ACC tier"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replication type of the storage account"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "allow_nested_items_to_be_public"
}

variable "network_rules_default_action" {
  type        = string
  description = "Default action of the network rules"
}

variable "stg_tags" {
  type        = map(string)
  description = "Tags for stg acc"
}

## CDN Frontdoor Endpoint
variable "frontdoor_endpoint_name" {
  type        = string
  description = "The name which should be used for this Front Door Endpoint. Changing this forces a new Front Door Endpoint to be created."
}
/*
variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The ID of the Front Door Profile within which this Front Door Endpoint should exist. Changing this forces a new Front Door Endpoint to be created."
}*/

variable "endpoint_enabled" {
  type        = bool
  description = "Specifies if this Front Door Endpoint is enabled?"
  default     = true
}

variable "frontdoor_endpoint_tags" {
  type        = map(string)
  description = "Specifies a mapping of tags which should be assigned to the Front Door Endpoint."
}

##CDN Frontdoor Custom Domain
variable "frontdoor_custom_domain_name" {
  type        = string
  description = " The name which should be used for this Front Door Custom Domain. Possible values must be between 2 and 260 characters in length, must begin with a letter or number, end with a letter or number and contain only letters, numbers and hyphens. Changing this forces a new Front Door Custom Domain to be created."
}
/*
variable "cdn_frontdoor_profile_id" {
  type = string
  description = "The ID of the Front Door Profile. Changing this forces a new Front Door Profile to be created."
}*/
/*
variable "host_name" {
  type = string
  description = " The host name of the domain. The host_name field must be the FQDN of your domain(e.g. contoso.fabrikam.com). Changing this forces a new Front Door Custom Domain to be created."
}*/

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

#CDN Frontdoor Rule Set
variable "frontdoor_rule_set_name" {
  type        = string
  description = "The name which should be used for this Front Door Rule Set. Changing this forces a new Front Door Rule Set to be created."
}

#cdn frontdoor route
variable "frontdoor_route_name" {
  type        = string
  description = "The name which should be used for this Front Door Route. Valid values must begin with a letter or number, end with a letter or number and may only contain letters, numbers and hyphens with a maximum length of 90 characters. Changing this forces a new Front Door Route to be created."
}

variable "cdn_frontdoor_endpoint_id" {
  type        = string
  description = "The resource ID of the Front Door Endpoint where this Front Door Route should exist. Changing this forces a new Front Door Route to be created."
}

variable "cdn_frontdoor_origin_group_id" {
  type        = string
  description = "The resource ID of the Front Door Origin Group where this Front Door Route should be created."
}

variable "cdn_frontdoor_origin_ids" {
  type        = list(string)
  description = "One or more Front Door Origin resource IDs that this Front Door Route will link to."
}

variable "cdn_frontdoor_custom_domain_ids" {
  type        = list(string)
  description = "The IDs of the Front Door Custom Domains which are associated with this Front Door Route."
}

variable "cdn_frontdoor_origin_path" {
  type        = string
  description = "A directory path on the Front Door Origin that can be used to retrieve content (e.g. contoso.cloudapp.net/originpath)."
}

variable "cdn_frontdoor_rule_set_ids" {
  type        = list(string)
  description = "A list of the Front Door Rule Set IDs which should be assigned to this Front Door Route."
}

variable "forwarding_protocol" {
  type        = string
  description = "The Protocol that will be use when forwarding traffic to backends. Possible values are HttpOnly, HttpsOnly or MatchRequest."
}

variable "patterns_to_match" {
  type        = list(string)
  description = "The route patterns of the rule."
}

variable "supported_protocols" {
  type        = list(string)
  description = "One or more Protocols supported by this Front Door Route. Possible values are Http or Https."
}

variable "query_string_caching_behavior" {
  type        = string
  description = "Defines how the Front Door Route will cache requests that include query strings. Possible values include IgnoreQueryString, IgnoreSpecifiedQueryStrings, IncludeSpecifiedQueryStrings or UseQueryString."
  default     = "IgnoreQueryString"
}

variable "query_strings" {
  type        = list(string)
  description = "Query strings to include or ignore."
}

variable "compression_enabled" {
  type        = bool
  description = " Is content compression enabled? Possible values are true or false."
  default     = false
}

variable "content_types_to_compress" {
  type        = list(string)
  description = " A list of one or more Content types (formerly known as MIME types) to compress. Possible values include application/eot, application/font, application/font-sfnt, application/javascript, application/json, application/opentype, application/otf, application/pkcs7-mime, application/truetype, application/ttf, application/vnd.ms-fontobject, application/xhtml+xml, application/xml, application/xml+rss, application/x-font-opentype, application/x-font-truetype, application/x-font-ttf, application/x-httpd-cgi, application/x-mpegurl, application/x-opentype, application/x-otf, application/x-perl, application/x-ttf, application/x-javascript, font/eot, font/ttf, font/otf, font/opentype, image/svg+xml, text/css, text/csv, text/html, text/javascript, text/js, text/plain, text/richtext, text/tab-separated-values, text/xml, text/x-script, text/x-component or text/x-java-source."
}

variable "route_enabled" {
  type        = bool
  description = "Is this Front Door Route enabled? Possible values are true or false."
  default     = true
}

variable "https_redirect_enabled" {
  type        = bool
  description = " Automatically redirect HTTP traffic to HTTPS traffic? Possible values are true or false."
  default     = true
}

variable "link_to_default_domain" {
  type        = bool
  description = "Should this Front Door Route be linked to the default endpoint? Possible values include true or false."
  default     = true
}

#cdn frontdoor custom domain association
variable "cdn_frontdoor_custom_domain_id" {
  type        = string
  description = "The ID of the Front Door Custom Domain that should be managed by the association resource. Changing this forces a new association resource to be created."
}

variable "cdn_frontdoor_route_ids" {
  type        = list(string)
  description = "One or more IDs of the Front Door Route to which the Front Door Custom Domain is associated with."
}