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

## CDN Frontdoor Profile
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the RG"
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
/*
variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The ID of the Front Door Profile within which this Front Door Endpoint should exist. Changing this forces a new Front Door Endpoint to be created."
}
*/
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

variable "cdn_frontdoor_origin_group_id" {
  type        = string
  description = " The ID of the Front Door Origin Group within which this Front Door Origin should exist. Changing this forces a new Front Door Origin to be created."
}

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

#CDN Frontdoor Rule Set
variable "frontdoor_rule_set_name" {
  type        = string
  description = "The name which should be used for this Front Door Rule Set. Changing this forces a new Front Door Rule Set to be created."
}

variable "cdn_frontdoor_profile_id" {
  type        = string
  description = "The ID of the Front Door Profile. Changing this forces a new Front Door Rule Set to be created."
}

#cdn frotndoor rule
variable "frontdoor_rule_name" {
  type        = string
  description = "The name which should be used for this Front Door Rule. Possible values must be between 1 and 260 characters in length, begin with a letter and may contain only letters and numbers. Changing this forces a new Front Door Rule to be created."
}

variable "cdn_frontdoor_rule_set_id" {
  type        = string
  description = "The resource ID of the Front Door Rule Set for this Front Door Rule. Changing this forces a new Front Door Rule to be created."
}

variable "order" {
  type        = number
  description = "The order in which the rules will be applied for the Front Door Endpoint. The order value should be sequential and begin at 1(e.g. 1, 2, 3…). A Front Door Rule with a lesser order value will be applied before a rule with a greater order value."
}

variable "behavior_on_match" {
  type        = string
  description = "If this rule is a match should the rules engine continue processing the remaining rules or stop? Possible values are Continue and Stop."
  default     = "Continue"
}

variable "url_rewrite_action_config" {
  type = object({
    source_pattern          = string
    destination             = string
    preserve_unmatched_path = bool
  })
  default = {
    destination             = null
    preserve_unmatched_path = false
    source_pattern          = null
  }
}

/*variable "url_rewrite_action_source_pattern" {
  type        = string
  description = "The source pattern in the URL path to replace. This uses prefix-based matching. For example, to match all URL paths use a forward slash / as the source pattern value."
}

variable "url_rewrite_action_destination" {
  type        = string
  description = "The destination path to use in the rewrite. The destination path overwrites the source pattern."
}

variable "url_rewrite_action_preserve_unmatched_path" {
  type        = bool
  description = "Append the remaining path after the source pattern to the new destination path? Possible values true or false."
  default     = false
}*/

variable "url_redirect_action_config" {
  type = object({
    redirect_type        = string
    destination_hostname = string
    redirect_protocol    = string
    destination_path     = string
    query_string         = string
    destination_fragment = string
  })
  default = {
    destination_fragment = null
    destination_hostname = null
    destination_path     = null
    redirect_protocol    = null
    query_string         = null
    redirect_type        = null
  }
}

/*variable "url_redirect_action_redirect_type" {
  type        = string
  description = "The response type to return to the requestor. Possible values include Moved, Found , TemporaryRedirect or PermanentRedirect."
}

variable "url_redirect_action_destination_hostname" {
  type        = string
  description = "The host name you want the request to be redirected to. The value must be a string between 0 and 2048 characters in length, leave blank to preserve the incoming host."
}

variable "url_redirect_action_redirect_protocol" {
  type        = string
  description = "The protocol the request will be redirected as. Possible values include MatchRequest, Http or Https."
  default     = "MatchRequest"
}

variable "url_redirect_action_destination_path" {
  type        = string
  description = "The path to use in the redirect. The value must be a string and include the leading /, leave blank to preserve the incoming path."
  default     = ""
}

variable "url_redirect_action_query_string" {
  type        = string
  description = "The query string used in the redirect URL. The value must be in the <key>=<value> or <key>={action_server_variable} format and must not include the leading ?, leave blank to preserve the incoming query string. Maximum allowed length for this field is 2048 characters."
  default     = ""
}

variable "url_redirect_action_destination_fragment" {
  type        = string
  description = "The fragment to use in the redirect. The value must be a string between 0 and 1024 characters in length, leave blank to preserve the incoming fragment."
  default     = ""
}*/

variable "route_configuration_override_action_config" {
  type = object({
    cache_duration                = string
    cdn_frontdoor_origin_group_id = string
    forwarding_protocol           = string
    query_string_caching_behavior = string
    query_string_parameters       = list(string)
    compression_enabled           = bool
    cache_behavior                = string
  })
  default = {
    cache_behavior                = null
    cache_duration                = null
    cdn_frontdoor_origin_group_id = null
    compression_enabled           = false
    forwarding_protocol           = null
    query_string_caching_behavior = null
    query_string_parameters       = [null]
  }
}

/*variable "route_configuration_override_action_cache_duration" {
  type        = string
  description = "When Cache behavior is set to Override or SetIfMissing, this field specifies the cache duration to use. The maximum duration is 366 days specified in the d.HH:MM:SS format(e.g. 365.23:59:59). If the desired maximum cache duration is less than 1 day then the maximum cache duration should be specified in the HH:MM:SS format(e.g. 23:59:59)."
  default     = "1.12:00:00"
}

variable "route_configuration_override_action_cdn_frontdoor_origin_group_id" {
  type        = string
  description = "The Front Door Origin Group resource ID that the request should be routed to. This overrides the configuration specified in the Front Door Endpoint route."
}

variable "route_configuration_override_action_forwarding_protocol" {
  type        = string
  description = "The forwarding protocol the request will be redirected as. This overrides the configuration specified in the route to be associated with. Possible values include MatchRequest, HttpOnly or HttpsOnly. Defaults to MatchRequest. Possible values include HttpOnly, HttpsOnly or MatchRequest."
  default     = "MatchRequest"
}

variable "route_configuration_override_action_query_string_caching_behavior" {
  type        = string
  description = "IncludeSpecifiedQueryStrings query strings specified in the query_string_parameters field get included when the cache key gets generated. UseQueryString cache every unique URL, each unique URL will have its own cache key. IgnoreSpecifiedQueryStrings query strings specified in the query_string_parameters field get excluded when the cache key gets generated. IgnoreQueryString query strings aren't considered when the cache key gets generated. Possible values include IgnoreQueryString, UseQueryString, IgnoreSpecifiedQueryStrings or IncludeSpecifiedQueryStrings."
  default     = "IgnoreQueryString"
}

variable "route_configuration_override_action_query_string_parameters" {
  type        = list(string)
  description = "A list of query string parameter names."
}

variable "route_configuration_override_action_compression_enabled" {
  type        = bool
  description = "Should the Front Door dynamically compress the content? Possible values include true or false."
  default     = false
}

variable "route_configuration_override_action_cache_behavior" {
  type        = string
  description = "HonorOrigin the Front Door will always honor origin response header directive. If the origin directive is missing, Front Door will cache contents anywhere from 1 to 3 days. OverrideAlways the TTL value returned from your Front Door Origin is overwritten with the value specified in the action. This behavior will only be applied if the response is cacheable. OverrideIfOriginMissing if no TTL value gets returned from your Front Door Origin, the rule sets the TTL to the value specified in the action. This behavior will only be applied if the response is cacheable. Disabled the Front Door will not cache the response contents, irrespective of Front Door Origin response directives. Possible values include HonorOrigin, OverrideAlways, OverrideIfOriginMissing or Disabled."
  default     = "HonorOrigin"
}*/

variable "request_header_action_config" {
  type = object({
    header_action = string
    header_name   = string
    value         = string
  })
  description = "The Request Header Action block"
  default = {
    header_action = null
    header_name   = null
    value         = null
  }
}

/*variable "request_header_action_header_action" {
  type        = string
  description = "The action to be taken on the specified header_name. Possible values include Append, Overwrite or Delete."
}

variable "request_header_action_header_name" {
  type        = string
  description = " The name of the header to modify."
}

variable "request_header_action_value" {
  type        = string
  description = "The value to append or overwrite."
}*/

variable "response_header_action_config" {
  type = object({
    header_action = string
    header_name   = string
    value         = string
  })
  description = "The Response Header Action block"
  default = {
    header_action = null
    header_name   = null
    value         = null
  }
}

/*variable "response_header_action_header_action" {
  type        = string
  description = "The action to be taken on the specified header_name. Possible values include Append, Overwrite or Delete."
}

variable "response_header_action_header_name" {
  type        = string
  description = "The name of the header to modify."
}

variable "response_header_action_value" {
  type        = string
  description = "The value to append or overwrite."
}*/

variable "remote_address_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Remote Address Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "request_method_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Request Method Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "query_string_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Query String Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "post_args_condition_config" {
  type = object({
    post_args_name   = string
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Post Args Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
    post_args_name   = null
  }
}

variable "request_uri_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Request Uri Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "request_header_condition_config" {
  type = object({
    header_name      = string
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Request Header Condition block"
  default = {
    header_name      = null
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "request_body_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Request Body Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "request_scheme_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Request Scheme Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "url_path_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Url Path Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "url_file_extension_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Url File Extension Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "url_filename_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Url File Name Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "http_version_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Http Version Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "cookies_condition_config" {
  type = object({
    cookie_name      = string
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Cookies Condition block"
  default = {
    cookie_name      = null
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "is_device_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Device Condition block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "socket_address_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Socket Address block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "client_port_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Client Port block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "server_port_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The Server Port block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}

variable "host_name_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
    transforms       = list(string)
  })
  description = "The Host Name block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
    transforms       = null
  }
}

variable "ssl_protocol_condition_config" {
  type = object({
    operator         = string
    negate_condition = bool
    match_values     = list(string)
  })
  description = "The SSL protocol block"
  default = {
    operator         = null
    negate_condition = false
    match_values     = null
  }
}