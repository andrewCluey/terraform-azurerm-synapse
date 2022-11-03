variable "workspace_name" {
  type        = string
  description = "description"
}

variable "resource_group_name" {
  type        = string
  description = "description"
}

variable "location" {
  type        = string
  description = "description"
  default     = "uksouth"
}

variable "data_lake_gen2_filesystem_id" {
  type        = string
  description = "description"
}

variable "storage_data_lake_gen2_filesystem_id" {
  type        = string
  description = "description"
}

variable "settings" {
  type        = any
  description = "description"
  default     = {}
}

variable "keyvault_id" {
  type        = string
  description = "description"
  default     = ""
}

variable "tags" {
  type        = map
  description = "description"
  default     = {}
}
