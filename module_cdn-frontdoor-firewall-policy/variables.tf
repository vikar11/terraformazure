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

## CDN Frontdoor Firewall Policy
variable "frontdoor_firewall_policy_name" {
  type        = string
  description = "The name of the policy. Changing this forces a new resource to be created."
}

variable "frontdoor_firewall_policy_sku_name" {
  type        = string
  description = " The sku's pricing tier for this Front Door Firewall Policy. Possible values include Standard_AzureFrontDoor or Premium_AzureFrontDoor."
}

variable "frontdoor_firewall_policy_enabled" {
  type        = bool
  description = "Is the Front Door Firewall Policy enabled?"
  default     = true
}

variable "frontdoor_firewall_policy_mode" {
  type        = string
  description = "The Front Door Firewall Policy mode. Possible values are Detection, Prevention."
  default     = "Prevention"
}

variable "redirect_url" {
  type        = string
  description = "If action type is redirect, this field represents redirect URL for the client."
}

variable "custom_rule_name" {
  type        = string
  description = "Gets name of the resource that is unique within a policy. This name can be used to access the resource."
}

variable "custom_rule_action" {
  type        = string
  description = "The action to perform when the rule is matched. Possible values are Allow, Block, Log, or Redirect."
}

variable "custom_rule_enabled" {
  type        = bool
  description = "Is the rule is enabled or disabled?"
  default     = true
}

variable "custom_rule_priority" {
  type        = number
  description = "The priority of the rule. Rules with a lower value will be evaluated before rules with a higher value."
  default     = 1
}

variable "custom_rule_type" {
  type        = string
  description = " The type of rule. Possible values are MatchRule or RateLimitRule."
}

variable "custom_rule_match_condition_match_variable" {
  type        = string
  description = "The request variable to compare with. Possible values are Cookies, PostArgs, QueryString, RemoteAddr, RequestBody, RequestHeader, RequestMethod, RequestUri, or SocketAddr."
}

variable "custom_rule_match_condition_match_values" {
  type        = list(string)
  description = "Up to 600 possible values to match. Limit is in total across all match_condition blocks and match_values arguments. String value itself can be up to 256 characters in length."
}

variable "custom_rule_match_condition_operator" {
  type        = string
  description = "Comparison type to use for matching with the variable value. Possible values are Any, BeginsWith, Contains, EndsWith, Equal, GeoMatch, GreaterThan, GreaterThanOrEqual, IPMatch, LessThan, LessThanOrEqual or RegEx."
}

variable "custom_rule_match_condition_selector" {
  type        = string
  description = "Match against a specific key if the match_variable is QueryString, PostArgs, RequestHeader or Cookies."
}

variable "custom_rule_match_condition_negation_condition" {
  type        = bool
  description = "Should the result of the condition be negated."
}

variable "custom_rule_match_condition_transforms" {
  type        = list(string)
  description = "Up to 5 transforms to apply. Possible values are Lowercase, RemoveNulls, Trim, Uppercase, URLDecode or URLEncode."
}

variable "custom_rule_rate_limit_duration_in_minutes" {
  type        = number
  description = "The rate limit duration in minutes."
  default     = 1
}

variable "custom_rule_rate_limit_threshold" {
  type        = number
  description = "The rate limit threshold."
  default     = 10
}

variable "custom_block_response_status_code" {
  type        = string
  description = " If a custom_rule block's action type is block, this is the response status code. Possible values are 200, 403, 405, 406, or 429."
}

variable "custom_block_response_body" {
  type        = string
  description = "If a custom_rule block's action type is block, this is the response body. The body must be specified in base64 encoding."
}

variable "managed_rule_type" {
  type        = string
  description = "The name of the managed rule to use with this resource. Possible values include DefaultRuleSet, Microsoft_DefaultRuleSet, BotProtection or Microsoft_BotManagerRuleSet."
}

variable "managed_rule_version" {
  type        = string
  description = "The version of the managed rule to use with this resource. Possible values depends on which DRS type you are using, for the DefaultRuleSet type the possible values include 1.0 or preview-0.1. For Microsoft_DefaultRuleSet the possible values include 1.1, 2.0 or 2.1. For BotProtection the value must be preview-0.1 and for Microsoft_BotManagerRuleSet the value must be 1.0."
}

variable "managed_rule_action" {
  type        = string
  description = "The action to perform when the managed rule is matched. Possible values depends on which DRS version you are using, for DRS 1.0, 1.1 and preview-0.1 the possible values include Allow, Block, Log, or Redirect. For DRS 2.0 and 2.1 the value must be AnomalyScoring."
}

variable "exclusion_match_variable" {
  type        = string
  description = "The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames, RequestBodyJsonArgNames"
}

variable "exclusion_operator" {
  type        = string
  description = "Comparison operator to apply to the selector when specifying which elements in the collection this exclusion applies to. Possible values are: Equals, Contains, StartsWith, EndsWith, EqualsAny."
}

variable "exclusion_selector" {
  type        = string
  description = "Selector for the value in the match_variable attribute this exclusion applies to."
}

variable "managed_rule_override_rule_group_name" {
  type        = string
  description = "The managed rule group to override."
}

variable "managed_rule_override_rule_rule_id" {
  type        = string
  description = "Identifier for the managed rule."
}

variable "managed_rule_override_rule_action" {
  type        = string
  description = "The action to be applied when the rule matches. Possible values are Allow, Log, Block, Redirect and AnomalyScoring."
}

variable "managed_rule_override_rule_enabled" {
  type        = bool
  description = "Is the managed rule override enabled or disabled."
  default     = false
}

variable "frontdoor_firewall_policy_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the Front Door Firewall Policy."
}
