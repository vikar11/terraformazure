variable "zone_name" {
  type        = string
  description = "The name of the Private DNS Zone (e.g., 'privatelink.database.windows.net')"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources"
}

variable "vnet_links" {
  type = list(object({
    name                 = string
    link_name            = string
    vnet_id              = string
    registration_enabled = bool
  }))
  default = []
  description = "List of virtual networks to link to the private DNS zone"
}
