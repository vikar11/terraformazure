variable "waf_policy_name" {
  description = "Name of the WAF policy"
  type        = string
  default     = "example-waf-policy"

}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "example-resource-group"
}

variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "East US"
}

variable "policy_enabled" {
  description = "Enable or disable the WAF policy"
  type        = bool
  default     = true
}

variable "policy_mode" {
  description = "Mode of the WAF policy (Prevention or Detection)"
  type        = string
  default     = "Prevention"
}

variable "request_body_check" {
  description = "Enable or disable request body check"
  type        = bool
  default     = true
}

variable "file_upload_limit_in_mb" {
  description = "File upload limit in MB"
  type        = number
  default     = 100
}

variable "max_request_body_size_in_kb" {
  description = "Max request body size in KB"
  type        = number
  default     = 128
}

variable "customrulename" {
  description = "Name of the custom rule"
  type        = string
  default     = "BlockSQLInjection"
}

variable "cutomprirority" {
  description = "Priority of the custom rule"
  type        = number
  default     = 1
}

variable "custom-ruletype" {
  description = "Type of the custom rule (MatchRule or RateLimitRule)"
  type        = string
  default     = "MatchRule"
}

variable "waf-action" {
  description = "Action of the WAF policy (Block, Allow, or Log)"
  type        = string
  default     = "Block"
}

variable "variable_name" {
  description = "Name of the variable for match conditions"
  type        = string
  default     = "QueryString"
}

variable "match_operator" {
  description = "Operator for match conditions"
  type        = string
  default     = "Contains"

}

variable "match_values" {
  description = "Values for match conditions"
  type        = list(string)
  default     = ["select", "union", "drop"]

}

variable "match-transforms" {
  description = "Transforms for match conditions"
  type        = list(string)
  default     = ["Lowercase"]

}

variable "negation_condition" {
  description = "Negation condition for match conditions"
  type        = bool
  default     = false
}

variable "mrtype" {
  description = "Type of the managed rule set (OWASP or MicrosoftDefault)"
  type        = string
  default     = "OWASP"

}

variable "mrversion" {
  description = "Version of the managed rule set"
  type        = string
  default     = "3.2"
}

variable "frontdoor_profile_name" {
  description = "Name of the Front Door profile"
  type        = string
  default     = "example-frontdoor-profile"
}

variable "afd-sku" {
  description = "SKU name for the Front Door profile"
  type        = string
  default     = "Standard_AzureFrontDoor"
}

variable "frontdoor_endpoint_name" {
  description = "Name of the Front Door endpoint"
  type        = string
  default     = "example-endpoint"
}

variable "endpoint_enabled" {
  description = "Enable or disable the Front Door endpoint"
  type        = bool
  default     = true
}

variable "rule_set_name" {
  description = "Name of the rule set"
  type        = string
  default     = "example-rule-set"
}

variable "origin_group_name" {
  description = "Name of the origin group"
  type        = string
  default     = "example-origin-group"
}

variable "session_affinity_enabled" {
  description = "Enable or disable session affinity"
  type        = bool
  default     = false
}

variable "origin_name" {
  description = "Name of the origin"
  type        = string
  default     = "example-origin"
}

variable "certificate_name_check_enabled" {
  description = "Enable or disable certificate name check"
  type        = bool
  default     = false
}

variable "origin_hostname" {
  description = "Host header for the origin"
  type        = string
  default     = "example.azurewebsites.net"
}

variable "origin_host_header" {
  description = "Host header for the origin"
  type        = string
  default     = "example.azurewebsites.net"
}

variable "http_port" {
  description = "HTTP port for the origin"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "HTTPS port for the origin"
  type        = number
  default     = 443
}


variable "enabled" {
  description = "Enable or disable the origin"
  type        = bool
  default     = true
}

variable "priority" {
  description = "Priority of the origin"
  type        = number
  default     = 1
}

variable "weight" {
  description = "Weight of the origin"
  type        = number
  default     = 1000
}

variable "route_name" {
  description = "Name of the route"
  type        = string
  default     = "example-route"

}

variable "route_enabled" {
  description = "Enable or disable the route"
  type        = bool
  default     = true
}

variable "forwarding_protocol" {
  description = "Forwarding protocol for the route"
  type        = string
  default     = "MatchRequest"
}

variable "https_redirect_enabled" {
  description = "Enable or disable HTTPS redirect"
  type        = bool
  default     = false
}

variable "patterns_to_match" {
  description = "Patterns to match for the route"
  type        = list(string)
  default     = ["/*"]
}

variable "supported_protocols" {
  description = "Supported protocols for the route"
  type        = list(string)
  default     = ["Http", "Https"]
}

variable "link_to_default_domain" {
  description = "Link to default domain for the route"
  type        = bool
  default     = false
}
