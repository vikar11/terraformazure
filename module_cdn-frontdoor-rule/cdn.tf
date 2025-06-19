resource "azurerm_cdn_frontdoor_rule" "frontdoor_rule" {
  name                      = var.frontdoor_rule_name
  cdn_frontdoor_rule_set_id = var.cdn_frontdoor_rule_set_id
  order                     = var.order
  actions {
    /*dynamic "url_rewrite_action" {
      for_each = var.url_rewrite_action_config.source_pattern != null && var.url_rewrite_action_config.destination != null ? [1] : []
      content {
        source_pattern          = var.url_rewrite_action_config.source_pattern
        destination             = var.url_rewrite_action_config.destination
        preserve_unmatched_path = var.url_rewrite_action_config.preserve_unmatched_path
      }
    }*/
    dynamic "url_redirect_action" {
      for_each = var.url_redirect_action_config.redirect_type != null && var.url_redirect_action_config.destination_hostname != null ? [1] : []
      content {
        redirect_type        = var.url_redirect_action_config.redirect_type
        destination_hostname = var.url_redirect_action_config.destination_hostname
        redirect_protocol    = var.url_redirect_action_config.redirect_protocol
        destination_path     = var.url_redirect_action_config.destination_path
        query_string         = var.url_redirect_action_config.query_string
        destination_fragment = var.url_redirect_action_config.destination_fragment
      }
    }
    dynamic "route_configuration_override_action" {
      for_each = var.route_configuration_override_action_config.cache_duration != null || var.route_configuration_override_action_config.forwarding_protocol != null || var.route_configuration_override_action_config.query_string_caching_behavior != null || var.route_configuration_override_action_config.cache_behavior != null ? [1] : []
      content {
        cache_duration                = var.route_configuration_override_action_config.cache_duration
        cdn_frontdoor_origin_group_id = var.route_configuration_override_action_config.cdn_frontdoor_origin_group_id
        forwarding_protocol           = var.route_configuration_override_action_config.forwarding_protocol
        query_string_caching_behavior = var.route_configuration_override_action_config.query_string_caching_behavior
        query_string_parameters       = var.route_configuration_override_action_config.query_string_parameters
        compression_enabled           = var.route_configuration_override_action_config.compression_enabled
        cache_behavior                = var.route_configuration_override_action_config.cache_behavior
      }
    }
    dynamic "request_header_action" {
      for_each = var.request_header_action_config.header_action != null && var.request_header_action_config.header_name != null ? [1] : []
      content {
        header_action = var.request_header_action_config.header_action
        header_name   = var.request_header_action_config.header_name
        value         = var.request_header_action_config.value
      }
    }
    dynamic "response_header_action" {
      for_each = var.response_header_action_config.header_action != null && var.response_header_action_config.header_name != null ? [1] : []
      content {
        header_action = var.response_header_action_config.header_action
        header_name   = var.response_header_action_config.header_name
        value         = var.response_header_action_config.value
      }
    }
  }
  behavior_on_match = var.behavior_on_match
  dynamic "conditions" {
    for_each = var.remote_address_condition_config != null || var.request_method_condition_config != null || var.query_string_condition_config != null || var.post_args_condition_config != null || var.request_uri_condition_config != null || var.request_header_condition_config != null || var.request_body_condition_config != null || var.request_scheme_condition_config != null || var.url_path_condition_config != null || var.url_file_extension_condition_config != null || var.url_filename_condition_config != null || var.http_version_condition_config != null || var.cookies_condition_config != null || var.is_device_condition_config != null || var.socket_address_condition_config != null || var.client_port_condition_config != null || var.server_port_condition_config != null || var.host_name_condition_config != null || var.ssl_protocol_condition_config != null ? [1] : []
    content {
      dynamic "remote_address_condition" {
        for_each = var.remote_address_condition_config.operator != null ? [1] : []
        content {
          operator         = var.remote_address_condition_config.operator
          negate_condition = var.remote_address_condition_config.negate_condition
          match_values     = var.remote_address_condition_config.match_values
        }
      }
      /*dynamic "request_method_condition" {
        for_each = var.request_method_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.request_method_condition_config.operator
          negate_condition = var.request_method_condition_config.negate_condition
          match_values     = var.request_method_condition_config.match_values
        }
      }*/
      /*dynamic "query_string_condition" {
        for_each = var.query_string_condition_config.operator != null ? [1] : []
        content {
          operator         = var.query_string_condition_config.operator
          negate_condition = var.query_string_condition_config.negate_condition
          match_values     = var.query_string_condition_config.match_values
          transforms       = var.query_string_condition_config.transforms
        }
      }*/
      dynamic "post_args_condition" {
        for_each = var.post_args_condition_config.post_args_name != null && var.post_args_condition_config.operator != null ? [1] : []
        content {
          post_args_name   = var.post_args_condition_config.post_args_name
          operator         = var.post_args_condition_config.operator
          negate_condition = var.post_args_condition_config.negate_condition
          match_values     = var.post_args_condition_config.match_values
          transforms       = var.post_args_condition_config.transforms
        }
      }
      /*dynamic "request_uri_condition" {
        for_each = var.request_uri_condition_config.operator != null ? [1] : []
        content {
          operator         = var.request_uri_condition_config.operator
          negate_condition = var.request_uri_condition_config.negate_condition
          match_values     = var.request_uri_condition_config.match_values
          transforms       = var.request_uri_condition_config.transforms
        }
      }*/
      /*dynamic "request_header_condition" {
        for_each = var.request_header_condition_config.header_name != null && var.request_header_condition_config.operator != null ? [1] : []
        content {
          header_name      = var.request_header_condition_config.header_name
          operator         = var.request_header_condition_config.operator
          negate_condition = var.request_header_condition_config.negate_condition
          match_values     = var.request_header_condition_config.match_values
          transforms       = var.request_header_condition_config.transforms
        }
      }*/
      /*dynamic "request_body_condition" {
        for_each = var.request_body_condition_config.operator != null && var.request_body_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.request_body_condition_config.operator
          negate_condition = var.request_body_condition_config.negate_condition
          match_values     = var.request_body_condition_config.match_values
          transforms       = var.request_body_condition_config.transforms
        }
      }*/
      /*dynamic "request_scheme_condition" {
        for_each = var.request_scheme_condition_config.operator != null || var.request_scheme_condition_config.negate_condition != null || var.request_scheme_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.request_scheme_condition_config.operator
          negate_condition = var.request_scheme_condition_config.negate_condition
          match_values     = var.request_scheme_condition_config.match_values
        }
      }*/
      dynamic "url_path_condition" {
        for_each = var.url_path_condition_config.operator != null ? [1] : []
        content {
          operator         = var.url_path_condition_config.operator
          negate_condition = var.url_path_condition_config.negate_condition
          match_values     = var.url_path_condition_config.match_values
          transforms       = var.url_path_condition_config.transforms
        }
      }
      dynamic "url_file_extension_condition" {
        for_each = var.url_file_extension_condition_config.operator != null && var.url_file_extension_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.url_file_extension_condition_config.operator
          negate_condition = var.url_file_extension_condition_config.negate_condition
          match_values     = var.url_file_extension_condition_config.match_values
          transforms       = var.url_file_extension_condition_config.transforms
        }
      }
      dynamic "url_filename_condition" {
        for_each = var.url_filename_condition_config.operator != null && var.url_filename_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.url_filename_condition_config.operator
          negate_condition = var.url_filename_condition_config.negate_condition
          match_values     = var.url_filename_condition_config.match_values
          transforms       = var.url_filename_condition_config.transforms
        }
      }
      /*dynamic "http_version_condition" { 
        for_each = var.http_version_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.http_version_condition_config.operator
          negate_condition = var.http_version_condition_config.negate_condition
          match_values     = var.http_version_condition_config.match_values
        }
      }*/
      /*dynamic "cookies_condition" { 
        for_each = var.cookies_condition_config.cookie_name != null && var.cookies_condition_config.operator != null ? [1] : []
        content {
          cookie_name      = var.cookies_condition_config.cookie_name
          operator         = var.cookies_condition_config.operator
          negate_condition = var.cookies_condition_config.negate_condition
          match_values     = var.cookies_condition_config.match_values
          transforms       = var.cookies_condition_config.transforms
        }
      }*/
      /*dynamic "is_device_condition" {
        for_each = var.is_device_condition_config.operator != null || var.is_device_condition_config.negate_condition != null || var.is_device_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.is_device_condition_config.operator
          negate_condition = var.is_device_condition_config.negate_condition
          match_values     = var.is_device_condition_config.match_values
        }
      }*/
      dynamic "socket_address_condition" {
        for_each = var.socket_address_condition_config.operator != null || var.socket_address_condition_config.negate_condition != null || var.socket_address_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.socket_address_condition_config.operator
          negate_condition = var.socket_address_condition_config.negate_condition
          match_values     = var.socket_address_condition_config.match_values
        }
      }
      dynamic "client_port_condition" {
        for_each = var.client_port_condition_config.operator != null ? [1] : []
        content {
          operator         = var.client_port_condition_config.operator
          negate_condition = var.client_port_condition_config.negate_condition
          match_values     = var.client_port_condition_config.match_values
        }
      }
      dynamic "server_port_condition" {
        for_each = var.server_port_condition_config.operator != null && var.server_port_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.server_port_condition_config.operator
          negate_condition = var.server_port_condition_config.negate_condition
          match_values     = var.server_port_condition_config.match_values
        }
      }
      dynamic "host_name_condition" {
        for_each = var.host_name_condition_config.operator != null && var.host_name_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.host_name_condition_config.operator
          negate_condition = var.host_name_condition_config.negate_condition
          match_values     = var.host_name_condition_config.match_values
          transforms       = var.host_name_condition_config.transforms
        }
      }
      dynamic "ssl_protocol_condition" {
        for_each = var.ssl_protocol_condition_config.match_values != null ? [1] : []
        content {
          operator         = var.ssl_protocol_condition_config.operator
          negate_condition = var.ssl_protocol_condition_config.negate_condition
          match_values     = var.ssl_protocol_condition_config.match_values
        }
      }
    }
  }
}