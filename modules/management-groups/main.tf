terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.0"
    }
  }
}
# provider "azurerm" {
#  features {}
# }

# Define the root management group under the tenant
resource "azurerm_management_group" "ims-root" {
  name      = "TescoIMSRootMG"
  display_name = "IMS-ROOT"
  parent_management_group_id = var.root_management_group_id # This is implicitly the tenant root
}

# Example usage of the management group resource ID (path):
output "management_group_id" {
  value = azurerm_management_group.ims_root.id
}
