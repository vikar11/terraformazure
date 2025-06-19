
#---------------------------------------- resource group variables -----------------------------------------
variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  type        = bool
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(any)
}

#------------------


variable "vnet" {
  description = <<EOF
  Details of Virtual Network:
    (Required) name - The name of the virtual network.
    (Required) address_space - The address space that is used the virtual network. You can supply more than one address space.
    (Optional) bgp_community - The BGP community attribute in format <as-number>:<community-value>.
    (Optional) dns_servers - List of IP addresses of DNS servers.
    (Optional) edge_zone - Specifies the Edge Zone within the Azure Region where this Virtual Network should exist.
    (Optional) flow_timeout_in_minutes - The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes.
    (Required) tags - A mapping of tags to assign to the resource.
    (Optional) ddos_protection_plan - A ddos_protection_plan block.
        (Required) id -  The ID of DDoS Protection Plan.
        (Required) enable - Enable/disable DDoS Protection Plan on Virtual Network.
    (Optional) encryption - A encryption block.
        (Required) enforcement - Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted.
  EOF
  type = list(object({
    name                    = string
    address_space           = list(string)
    bgp_community           = optional(string)
    dns_servers             = optional(list(string))
    edge_zone               = optional(string)
    flow_timeout_in_minutes = optional(number)
    tags                    = map(string)
    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }))
    encryption = optional(object({
      enforcement = string
    }))
  }))
}

#-------------------

variable "subnets" {
  description = <<EOF
  List of object in which user have to define the detailes of Subnets:
    (Required) name - The name of the subnet.
    (Required) virtual_network_name - The name of the virtual network to which to attach the subnet.
    (Required) address_prefixes - The address prefixes to use for the subnet.
    (Optional) delegation - A delegation block.
      (Required) name - A name for this delegation.
      (Required) service_delegation - A service_delegation block as defined below.
        (Required) name - The name of service to delegate to.
        (Optional) actions - A list of Actions which should be delegated. This list is specific to the service to delegate to.
    (Optional) private_endpoint_network_policies_enabled - Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    (Optional) private_link_service_network_policies_enabled - (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.
    (Optional) service_endpoints - The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Storage.Global and Microsoft.Web.
    (Optional) service_endpoint_policy_ids - The list of IDs of Service Endpoint Policies to associate with the subnet.
  EOF
  type = list(object({
    name                 = string
    virtual_network_name = string
    address_prefixes     = list(string)
    delegation = optional(list(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string))
      })
    })))
    private_endpoint_network_policies_enabled     = optional(bool)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoints                             = optional(list(string))
    service_endpoint_policy_ids                   = optional(list(string))
  }))
}

#------------------------------------AKS-----------------------------------------

# variable "location" {
#   description = "The Azure region where resources will be deployed."
#   type        = string
# }

# variable "resource_group_name" {
#   description = "The name of the resource group in which to create the AKS cluster."
#   type        = string
# }

variable "vnet_name" {
  description = "The name of the existing Virtual Network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the existing subnet in the VNet where AKS nodes will reside."
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The initial node count for the default node pool."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "The size of the Virtual Machines to use for the AKS nodes."
  type        = string
  default     = "Standard_DS2_v2"
}

# variable "tags" {
#   description = "A map of tags to assign to the resources."
#   type        = map(string)
#   default     = {}
# }

#----------------------

variable "registery_name" {
  description = "Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created."
  type        = string
}

// variable "resource_group_name" {
//   description = "A container that holds related resources for an Azure solution"
//   type        = string
// }

// variable "location" {
//   description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
//   type        = string
// }

variable "sku" {
  description = "The SKU name of the the container registry. Possible values are Basic, Standard, Premium."
  type        = string
} 

// variable "tags" {
//   description = "A mapping of tags to assign to the resource."
//   type        = map(string)
// }

#---------------------------Key Vault-----------------------------------------

variable "keyvault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

// variable "location" {
//   description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
//   type        = string
// }

// variable "resource_group_name" {
//   description = "Resource group name"
//   type        = string
// }

variable "kv_sku" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  type        = string
}

// variable "tags" {
//   description = "The tags to associate with your network and subnets."
//   type        = map(string)
// }

#--------------------Private Endpoint

// variable "create_resource_group" {
//   description = "Whether to create resource group and use it for all networking resources. "
//   type        = bool
// }

// variable "resource_group_name" {
//   description = "Resource group name. "
//   type        = string
// }

// variable "location" {
//   description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
//   type        = string
// }

#----------------Tags------------------#
// variable "tags" {
//   description = "Tag Name. "
//   type        = map(any)
// }

variable "subnet_id" {
  description = "Id of subnet"
  #default = ""
}

#---------------END POINT----------------#
variable "private_endpoint_name" {
  description = "pvt endpoint name in Azure. "
  type        = string
}

variable "private_service_connection_name" {
  description = "service connection name in Azure. "
  type        = string
}

variable "private_connection_resource_id" {
  description= "ID of resource to be associated. "
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
}

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

variable "custom_network_interface_name" {
  description = "The custom name of the network interface attached to the private endpoint. "
  type        = string
  default     = null
}

#----------------------------------------------------------------
variable "private_connection_resource_alias" {
  description = "alias name. "
  type=string
}

#-------------------Private DNS Zone

variable "zone_name" {
  type        = string
  description = "Private DNS Zone name"
}

// variable "resource_group_name" {
//   type        = string
//   description = "Resource Group in which to create the DNS zone"
// }

// variable "tags" {
//   type        = map(string)
//   default     = {}
//   description = "Tags to apply to resources"
// }

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

#----------------------Managed Identity

variable "identity_name" {
  type        = string
  description = "Name of the User Assigned Identity"
}

// variable "resource_group_name" {
//   type        = string
//   description = "Name of the resource group"
// }

// variable "location" {
//   type        = string
//   description = "Azure location"
// }

// variable "tags" {
//   type        = map(string)
//   default     = {}
//   description = "Tags to apply"
// }

#--------------------

// ## CDN Frontdoor Profile

variable "enabled" {
  description = "Controls whether the Front Door deployment is enabled"
  type        = bool
  default     = true
}

variable "waf_policy_name" {
  description = "Name of the WAF policy"
  type        = string
  default     = "example-waf-policy"

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
