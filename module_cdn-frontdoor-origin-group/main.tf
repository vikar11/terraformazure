// resource "azurerm_cdn_frontdoor_origin_group" "frontdoor_origin_group" {
//   name                     = var.frontdoor_origin_group_name
//   cdn_frontdoor_profile_id = var.cdn_frontdoor_profile_id

//   load_balancing {
//     additional_latency_in_milliseconds = var.load_balancing_additional_latency_in_milliseconds
//     sample_size                        = var.load_balancing_sample_size
//     successful_samples_required        = var.load_balancing_successful_samples_required
//   }

//   dynamic "health_probe" {
//     //for_each = var.health_probe_config.protocol == "Http" || var.health_probe_config.protocol == "Https" && var.h
//     for_each = var.health_probe_protocol != null && var.health_probe_interval_in_seconds != null ? [1] : []
//     content {
//       interval_in_seconds = var.health_probe_interval_in_seconds
//       path                = var.health_probe_path
//       protocol            = var.health_probe_protocol
//       request_type        = var.health_probe_request_type
//     }
//   }

//   restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time_to_healed_or_new_endpoint_in_minutes


//   session_affinity_enabled = var.session_affinity_enabled





// }