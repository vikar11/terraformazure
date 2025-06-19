# WAF Policy
resource "azurerm_web_application_firewall_policy" "waf" {
  name                = var.waf_policy_name
  resource_group_name = var.resource_group_name
  location            = var.location

  policy_settings {
    enabled                     = var.policy_enabled              //true
    mode                        = var.policy_mode                 //"Prevention"
    request_body_check          = var.request_body_check          //true
    file_upload_limit_in_mb     = var.file_upload_limit_in_mb     //100
    max_request_body_size_in_kb = var.max_request_body_size_in_kb //128
  }

  custom_rules {
    name      = var.customrulename  //"BlockSQLInjection"
    priority  = var.cutomprirority  //1
    rule_type = var.custom-ruletype //"MatchRule"
    action    = var.waf-action      //"Block"

    match_conditions {
      match_variables {
        variable_name = var.variable_name //"QueryString"
      }
      operator           = var.match_operator     //"Contains"
      match_values       = var.match_values       //["select", "union", "drop"]
      transforms         = var.match-transforms   //["Lowercase"]
      negation_condition = var.negation_condition //false
    }
  }

  managed_rules {
    managed_rule_set {
      type    = var.mrtype    //"OWASP"
      version = var.mrversion //"3.2"
    }
  }
}

# Front Door Profile
resource "azurerm_cdn_frontdoor_profile" "afd" {
  name                = var.frontdoor_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = var.afd-sku //"Standard_AzureFrontDoor"
}

# Front Door Endpoint
resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.afd.id
  enabled                  = var.endpoint_enabled //true
}

resource "azurerm_cdn_frontdoor_rule_set" "example" {
  name                     = var.rule_set_name //"example-rule-set"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.afd.id
}

# Origin Group
resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
  name                     = var.origin_group_name //"example-origin-group"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.afd.id
  session_affinity_enabled = var.session_affinity_enabled //false

  load_balancing {
    sample_size                 = 4
    successful_samples_required = 3
  }

  health_probe {
    interval_in_seconds = 120
    path                = "/"
    protocol            = "Http"
    request_type        = "GET"
  }
}

# Origin (example pointing to Azure Website)
resource "azurerm_cdn_frontdoor_origin" "origin" {
  name                           = var.origin_name //"example-origin"
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.origin_group.id
  certificate_name_check_enabled = var.certificate_name_check_enabled //false
  host_name                      = var.origin_hostname                //"example.azurewebsites.net"
  http_port                      = var.http_port                      //80
  https_port                     = var.https_port                     //443
  enabled                        = var.enabled                        //true
  origin_host_header             = var.origin_host_header             //"example.azurewebsites.net"
  priority                       = var.priority                       //1
  weight                         = var.weight                         //1000
}

# Route
resource "azurerm_cdn_frontdoor_route" "route" {
  name                          = var.route_name //"example-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.origin.id]
  cdn_frontdoor_rule_set_ids    = [azurerm_cdn_frontdoor_rule_set.example.id]
  enabled                       = var.route_enabled //true

  forwarding_protocol    = var.forwarding_protocol    //"MatchRequest"
  https_redirect_enabled = var.https_redirect_enabled //false
  patterns_to_match      = var.patterns_to_match      //["/*"]
  supported_protocols    = var.supported_protocols    //["Http", "Https"]

  link_to_default_domain = var.link_to_default_domain //false
}
