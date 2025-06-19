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