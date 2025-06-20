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
  value = azurerm_management_group.ims-root.id
}
# Create tier 1 management groups
resource "azurerm_management_group" "platform" {
  name        = "platform"
  display_name = "platform"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}

resource "azurerm_management_group" "environments" {
  name        = "environments"
  display_name = "environments"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}
resource "azurerm_management_group" "sandbox" {
  name        = "ims-sandbox"
  display_name = "ims-sandbox"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}
resource "azurerm_management_group" "decommissioned" {
  name        = "ims-decommissioned"
  display_name = "ims-decommissioned"
  parent_management_group_id = var.root_management_group_id # Use the root management group ID directly
}
# Create tier 2 Management Groups
resource "azurerm_management_group" "Development" {
  name        = "ims-environments-development"
  display_name = "ims-environments-development"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "envproduction" {
  name        = "ims-environments-production"
  display_name = "ims-environments-production"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "non_prod" {
  name        = "ims-platform-nonprod"
  display_name = "ims-platform-nonprod"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "production" {
  name        = "ims-platform-prod"
  display_name = "ims-platform-production"
  parent_management_group_id = azurerm_management_group.platform.id
}
