#-------------RESOURCE GROUP-----------#
variable "resource_group_name" {
  description = "RG name in Azure. "
  type        = string  
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

#----------------TAGS------------------#
variable "tags" {
  description = "Tag Name. "
  type        = map(any)
}

# #---------------END POINT----------------#
variable "private_dns_zone_group" {
  description = <<EOF
    (Required) name - Specifies the Name of the Private DNS Zone Group.
    (Required) private_dns_zone_ids - Specifies the list of Private DNS Zones to include within the private_dns_zone_group.
  EOF
  type = list(object({
    name                 = string
    private_dns_zone_ids = list(string)
  }))
  default = []
}

variable "ip_configuration" {
  description = <<EOF
    (Required) name - Specifies the Name of the IP Configuration. Changing this forces a new resource to be created.
    (Required) private_ip_address - Specifies the static IP address within the private endpoint's subnet to be used. Changing this forces a new resource to be created.
    (Optional) subresource_name - Specifies the subresource this IP address applies to. subresource_names corresponds to group_id. Changing this forces a new resource to be created.
    (Optional) member_name - Specifies the member name this IP address applies to. If it is not specified, it will use the value of subresource_name. Changing this forces a new resource to be created.
  EOF
  type = list(object({
    name                 = string
    private_ip_address   = string
    subresource_name     = optional(string)
    member_name          = optional(string)
  }))
  default = []
}

variable "private_endpoint_name" {
  description = "pvt endpoint name in Azure. "
  type        = string
}

variable "private_service_connection_name" {
  description = "service connection name in Azure. "
  type        = string
}

variable "subresource_names" {
  description = "sub resources names in Azure. "
  type        = list(string)
}

variable "is_manual_connection" {
  description = "Status of manual connection. "
  type        = string
}

variable "request_message" {
  description = "request msg. "
  type        = string
  default     = "PL"
}

variable "private_connection_resource_id" {
  description = "ID of resource to be associated. "
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Id of subnet. "
  type        = string
}

variable "private_connection_resource_alias" {
  description = "alias name. "
  type        = string
  default     = null
}

variable "custom_network_interface_name" {
  description = "The custom name of the network interface attached to the private endpoint. "
  type        = string
  default     = null
}

