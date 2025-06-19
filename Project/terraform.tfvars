#--------------Resource Group

create_resource_group = true
resource_group_name   = "rg-alzspokerg-dev-eastus2-001"
location              = "East US2"
tags = {
  Project_ID = "xyz"
  Owner      = "vikar.s.ahmad@gds.ey.com"
}

#--------------Virtual Network

vnet = [{
  name          = "vnet-alzspokerg-dev-eastus2-001"
  address_space = ["10.50.0.0/16"]
  tags = {
    contact_name     = "Vikar Ahmad"
    contact_email    = "vikar.s.ahmad@gds.ey.com"
    project          = "CIL2.0"
    region           = "East US2"
    Application_name = "Dev"
  }
}
]

#-------------Subnet

subnets = [{
  name                                          = "snet-alzspokerg-dev-eastus2-001"
  virtual_network_name                          = "vnet-alzspokerg-dev-eastus2-001"
  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = true
  service_endpoint_policy_ids                   = null
  address_prefixes                              = ["10.50.0.0/24"]
  }]

 #-------------AKS

# location            = "West US2"
# resource_group_name = "Spoke-RG2"
vnet_name           = "vnet-alzspokerg-dev-eastus2-001"
subnet_name         = "snet-alzspokerg-dev-eastus2-001"
cluster_name        = "aks-alzspokerg-dev-eastus2-001"
dns_prefix          = "aksdemoprefix"
node_count          = 2
vm_size             = "Standard_DS2_v2"
# tags = {
#   environment = "dev"

#---------------Container Registry

registery_name = "cralzspokergdeveastus2001"
// resource_group_name = "rg-cil-development"
// location            = "East US"
sku                 = "Basic"
// tags = {
//   environment = "Production"
//   project     = "CIL 2.0"
// }

#-------------Key Vault

keyvault_name       = "kvrgdeveastus2001"
// location            = "eastus"
// resource_group_name = "rg-cil-development"
kv_sku              = "standard"
// tags = {
//   Project_ID = "CIL2.0"
//   Owner      = "sudipta.@gds.ey.com"
// }

#-------------------


private_connection_resource_alias = null
private_endpoint_name           = "pep-alzspokerg-dev-eastus2-001"
private_service_connection_name = "privateserviceconnection-storr345789"
subresource_names               = ["Blob"]
is_manual_connection            = false
request_message                 = "PL"
subnet_id = "/subscriptions/5ab24318-463b-45a8-806d-cc2d0cf9a3d0/resourceGroups/rg-alzspokerg-dev-eastus2-001/providers/Microsoft.Network/virtualNetworks/vnet-alzspokerg-dev-eastus2-001/subnets/snet-alzspokerg-dev-eastus2-001"

private_dns_zone_group =  [{
    name = "privatelink.blob.core.windows.net"
    private_dns_zone_ids = [
      "/subscriptions/5ab24318-463b-45a8-806d-cc2d0cf9a3d0/resourceGroups/rg-alzspokerg-dev-eastus2-001/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
    ]
  }]
private_connection_resource_id = "/subscriptions/5ab24318-463b-45a8-806d-cc2d0cf9a3d0/resourceGroups/terraform-rg/providers/Microsoft.Storage/storageAccounts/vikartfstacc"

#-------------------Private DNS Zone

zone_name           = "privatelink.blob.core.windows.net"
// resource_group_name = "rg-dns-prod"

// tags = {
//   environment = "prod"
//   owner       = "network-team"
// }

vnet_links = [
  {
    name                 = "vnet-alz"
    link_name            = "vnet-alz-link"
    vnet_id              = "/subscriptions/5ab24318-463b-45a8-806d-cc2d0cf9a3d0/resourceGroups/rg-alzspokerg-dev-eastus2-001/providers/Microsoft.Network/virtualNetworks/vnet-alzspokerg-dev-eastus2-001"
    registration_enabled = false
  }
]

#---------------Managed Identity

identity_name        = "mialzspokergdeveastus2001"
// resource_group_name  = "rg-identity-dev"
// location             = "eastus"
// tags = {
//   environment = "dev"
//   owner       = "infra-team"
// }

 #---------------Azure Front Door

waf_policy_name                = "alzwafpolicyeastus2"
policy_enabled                 = true
policy_mode                    = "Prevention"
request_body_check             = true
file_upload_limit_in_mb        = 100
max_request_body_size_in_kb    = 128
customrulename                 = "BlockSQLInjection"
cutomprirority                 = 1
custom-ruletype                = "MatchRule"
waf-action                     = "Block"
variable_name                  = "QueryString"
match_operator                 = "Contains"
match_values                   = ["select", "union", "drop"]
match-transforms               = ["Lowercase"]
negation_condition             = false
mrtype                         = "OWASP"
mrversion                      = "3.2"
frontdoor_profile_name         = "alzfdprofileeastus2"
afd-sku                        = "Premium_AzureFrontDoor"
frontdoor_endpoint_name        = "alzendpointeastus2"
endpoint_enabled               = true
origin_group_name              = "alzorigingroupeastus2"
session_affinity_enabled       = false
origin_name                    = "alzorigineastus2"
certificate_name_check_enabled = false
origin_hostname                = "10.70.0.4"
http_port                      = 80
https_port                     = 443
origin_host_header             = "10.70.0.4"
priority                       = 1
weight                         = 1000
route_name                     = "alzrouteeastus2"
route_enabled                  = true
forwarding_protocol            = "MatchRequest"
https_redirect_enabled         = false
patterns_to_match              = ["/*"]
supported_protocols            = ["Http", "Https"]
link_to_default_domain         = true
rule_set_name = "alzruleseteastus2"