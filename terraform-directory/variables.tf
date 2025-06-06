variable "root_management_group_id" {
  description = "The ID of the root management group (usually your tenant ID or 'root')."
  type        = string
  default     = "/providers/Microsoft.Management/managementGroups/root" # Replace with your actual root management group ID
}

variable "parent_management_group_name" {
  description = "Name of the parent management group under the root."
  type        = string
  default     = "IMSRoot"
}

variable "child_management_groups" {
  description = "A map of child management groups to be created under the parent management group."
  type        = map(string)
  default = {
    "platform"   = "Platform services"
    "environments"    = "Environments"
    "sandbox"    = "Sandbox environments"
    "decommissioned"   = "Decommissioned"
  }
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
