# Module: modules/aks/variables.tf
variable "cluster_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "dns_prefix" {}
variable "node_count" {}
variable "vm_size" {}
variable "subnet_id" {}
variable "tags" {
  type    = map(string)
  default = {}
}