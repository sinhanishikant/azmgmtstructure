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
provider "azurerm" {
  features {}
}

# Define the root management group under the tenant
resource "azurerm_management_group" "ims_root" {
  name      = var.parent_management_group_name
  display_name = var.parent_management_group_name
  parent_management_group_id = var.root_management_group_id # This is implicitly the tenant root
}

# Example usage of the management group resource ID (path):
output "management_group_id" {
  value = azurerm_management_group.ims_root.id
}
# Tier 1 Groups
resource "azurerm_management_group" "tier1" {
  for_each = var.child_management_groups
  display_name = each.value
  name         = each.key
  parent_management_group_id = azurerm_management_group.ims_root.id
}
# Tier 2 under Platform
resource "azurerm_management_group" "non_prod" {
  name         = "NonProd"
  display_name = "Non Prod"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "platform_production" {
  name         = "PlatformProduction"
  display_name = "Production"
  parent_management_group_id = azurerm_management_group.platform.id
}

# Tier 2 under Environments
resource "azurerm_management_group" "development" {
  name         = "Development"
  display_name = "Development"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "test" {
  name         = "Test"
  display_name = "Test"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "preproduction" {
  name         = "PreProduction"
  display_name = "PreProduction"
  parent_management_group_id = azurerm_management_group.environments.id
}

resource "azurerm_management_group" "env_production" {
  name         = "EnvProduction"
  display_name = "Production"
  parent_management_group_id = azurerm_management_group.environments.id
}
