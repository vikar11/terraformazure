####--------------------------------------------------------------------------------------#####
#  subnet id is mandatory for creating private endpoint 
#---------------------------------------------------------------------------------------
resource "azurerm_private_endpoint" "endpoint" {

  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  tags                = var.tags

  private_service_connection {
    // either specify private_connection_resource_id or private_connection_resource_alias
    name                              = var.private_service_connection_name
    private_connection_resource_id    = var.private_connection_resource_id != null ? var.private_connection_resource_id : null //optional
    is_manual_connection              = var.is_manual_connection
    subresource_names                 = var.subresource_names
    request_message                   = var.is_manual_connection == true ? var.request_message : null
    private_connection_resource_alias = var.private_connection_resource_alias != null ? var.private_connection_resource_alias : null //optional
  }

  dynamic "private_dns_zone_group" {

    for_each = var.private_dns_zone_group != null ? var.private_dns_zone_group : []
    content {
      name                 = private_dns_zone_group.value.name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_ids
    }
  }

  custom_network_interface_name        = var.custom_network_interface_name

  dynamic "ip_configuration" {

    for_each = var.ip_configuration != null ? var.ip_configuration : []
    content {
      name                 = ip_configuration.value.name
      private_ip_address   = ip_configuration.value.private_ip_address
      subresource_name     = ip_configuration.value.subresource_name
      member_name          = ip_configuration.value.member_name
    }
  }
}



