variable "name" {
  type        = string
  description = "Name of the managed identity"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group to create the identity in"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to assign to the identity"
}
