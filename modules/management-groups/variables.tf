variable "root_management_group_id" {
  description = "The ID of the root management group (usually your tenant ID or 'root')."
  type        = string
  default     = "/providers/Microsoft.Management/managementGroups/1a4d2aaa-669c-4d02-a275-bd3716545470" # Replace with your actual root management group ID
}

variable "parent_management_group_name" {
  description = "Name of the parent management group under the root."
  type        = string
  default     = "IMS-ROOT"
}

variable "location" { 
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}
