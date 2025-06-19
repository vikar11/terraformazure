#Reference to resource group creation module
module "resource_group" {
  source                = "../terraform-azure-resource-group/"
  create_resource_group = var.create_resource_group
  name                  = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

#--------------------

module "vnet" {
  source              = "../terraform-azurerm-virtual-network"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  vnet                = var.vnet
}

#----------------------

module "subnet" {
  source              = "../terraform-azurerm-subnet"
  resource_group_name = module.resource_group.name
  subnets             = var.subnets
}

#------------

module "private_dns_zone" {
  source              = "../terraform-azurerm-private-dns-zone"
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  vnet_links          = var.vnet_links
}


#------------

module "private_endpoint" {
  source                            = "../terraform-azurerm-private-endpoint"
  resource_group_name               = module.resource_group.name
  location                          = module.resource_group.location
  subnet_id                         = var.subnet_id
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  private_connection_resource_id    = var.private_connection_resource_id
  ip_configuration                  = var.ip_configuration
  custom_network_interface_name     = var.custom_network_interface_name
}


#------------

#Reference to azure container registry creation module
module "container_registry" {
  source                      = "../terraform-azurerm-container-registry"
  registery_name              = var.registery_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.sku
  tags                        = var.tags
}

#-------------

module "keyvault" {
  source              = "../terraform-azurerm-keyvault"
  keyvault_name       = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kv_sku              = var.kv_sku
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = var.tags
}

#-------------

module "aks" {
  source              = "../terraform-azurerm-kubernetes"
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
  subnet_id           = data.azurerm_subnet.subnet.id
  tags                = var.tags
}

#----------------Managed Idetity

module "managed_identity" {
  source              = "../terraform-azurerm-managed-identity"
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

// #----------------Azure Front Door

module "froontdoor" {
  source                         = "../frontdoor"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  waf_policy_name                = var.waf_policy_name
  policy_enabled                 = var.policy_enabled
  policy_mode                    = var.policy_mode
  request_body_check             = var.request_body_check
  file_upload_limit_in_mb        = var.file_upload_limit_in_mb
  max_request_body_size_in_kb    = var.max_request_body_size_in_kb
  customrulename                 = var.customrulename
  cutomprirority                 = var.cutomprirority
  custom-ruletype                = var.custom-ruletype
  waf-action                     = var.waf-action
  variable_name                  = var.variable_name
  match_operator                 = var.match_operator
  match_values                   = var.match_values
  match-transforms               = var.match-transforms
  negation_condition             = var.negation_condition
  mrtype                         = var.mrtype
  mrversion                      = var.mrversion
  frontdoor_profile_name         = var.frontdoor_profile_name
  afd-sku                        = var.afd-sku
  frontdoor_endpoint_name        = var.frontdoor_endpoint_name
  endpoint_enabled               = var.endpoint_enabled
  rule_set_name                  = var.rule_set_name
  origin_group_name              = var.origin_group_name
  session_affinity_enabled       = var.session_affinity_enabled
  origin_name                    = var.origin_name
  certificate_name_check_enabled = var.certificate_name_check_enabled
  origin_hostname                = var.origin_hostname
  https_port                     = var.https_port
  http_port                      = var.http_port
  enabled                        = var.enabled
  origin_host_header             = var.origin_host_header
  priority                       = var.priority
  weight                         = var.weight
  route_name                     = var.route_name
  route_enabled                  = var.route_enabled
  forwarding_protocol            = var.forwarding_protocol
  https_redirect_enabled         = var.https_redirect_enabled
  patterns_to_match               = var.patterns_to_match
  supported_protocols            = var.supported_protocols
  link_to_default_domain         = var.link_to_default_domain
  #depends_on                     = [module.service_plan, module.acr, module.storageaccount, module.key_vault, module.service_plan]
}

#------------------
