variable "root_management_group_id" {
  description = "The ID of the root management group (usually your tenant ID or 'root')."
  type        = string
  default     = "/providers/Microsoft.Management/managementGroups/1a4d2aaa-669c-4d02-a275-bd3716545470" # Replace with your actual root management group ID
}

variable "parent_management_group_name" {
  description = "Name of the parent management group under the root."
  type        = string
  default     = "IMS-Root"
}

variable "location" { 
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}

variable "admin_password" {
  description = "The admin password"
  type        = string
  sensitive   = true
}

variable "prefix" {
  description = "Prefix for all resources"
  type        = string
  default     = "practice"
}
variable "tags" {
  description = "Tags for all management groups."
  type        = map(string)
  default = {
    environment = "management"
    owner       = "IMS"
    created_by  = "terraform"
  }
}

variable "platform_mg_defaults_enable" {
  description = "Deploys Management, Identity and Connectivity Management Groups beneath Platform Management Group if set to true."
  type        = bool
  default     = true
}

variable "landing_zone_mg_children" {
  description = "Dictionary Object to allow additional or different child Management Groups of IMS Root Management Group to be deployed."
  type        = map(any)
  default     = {}
}

variable "platform_mg_children" {
  description = "Dictionary Object to allow additional or different child Management Groups of Platform Management Group to be deployed."
  type        = map(any)
  default     = {}
}

variable "telemetry_opt_out" {
  description = "Set Parameter to true to Opt-out of deployment telemetry."
  type        = bool
  default     = false
}

variable "backend_resource_group_name" {
  description = "The name of the backend resource group"
  type        = string
}

variable "backend_storage_account_name" {
  description = "The name of the backend storage account"
  type        = string
}

variable "backend_container_name" {
  description = "The name of the backend container"
  type        = string
}

variable "backend_key" {
  description = "The key for the backend state file"
  type        = string
}

# Management Group variables matching main.tf

variable "tenant_root_management_group_name" {
  description = "The name of the tenant root management group."
  type        = string
  default     = "TenantRoot"
}

variable "tenant_root_management_group_display_name" {
  description = "The display name of the tenant root management group."
  type        = string
  default     = "Tenant Root Group"
}

variable "platform_management_group_name" {
  description = "The name of the platform management group."
  type        = string
  default     = "Platform"
}

variable "platform_management_group_display_name" {
  description = "The display name of the platform management group."
  type        = string
  default     = "Platform Management Group"
}

variable "environments_management_group_name" {
  description = "The name of the environments management group."
  type        = string
  default     = "Environments"
}

variable "environments_management_group_display_name" {
  description = "The display name of the environments management group."
  type        = string
  default     = "Environments Management Group"
}

variable "sandbox_management_group_name" {
  description = "The name of the sandbox management group."
  type        = string
  default     = "Sandbox"
}

variable "sandbox_management_group_display_name" {
  description = "The display name of the sandbox management group."
  type        = string
  default     = "Sandbox Management Group"
}

variable "non_prod_management_group_name" {
  description = "The name of the non-production management group."
  type        = string
  default     = "NonProd"
}

variable "non_prod_management_group_display_name" {
  description = "The display name of the non-production management group."
  type        = string
  default     = "Non-Production Management Group"
}

variable "production_management_group_name" {
  description = "The name of the production management group."
  type        = string
  default     = "Production"
}

variable "production_management_group_display_name" {
  description = "The display name of the production management group."
  type        = string
  default     = "Production Management Group"
}

variable "decommissioned_management_group_name" {
  description = "The name of the decommissioned management group."
  type        = string
  default     = "Decommissioned"
}

variable "decommissioned_management_group_display_name" {
  description = "The display name of the decommissioned management group."
  type        = string
  default     = "Decommissioned Management Group"
}
