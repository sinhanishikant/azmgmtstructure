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
  name      = "IMSRoot"
  display_name = "IMS Root"
  parent_management_group_id = "Tenant Root Group" # This is implicitly the tenant root
}

# Tier 1 Groups
resource "azurerm_management_group" "platform" {
  name         = "Platform"
  display_name = "Platform"
  parent_management_group_id = azurerm_management_group.ims_root.id
}

resource "azurerm_management_group" "environments" {
  name         = "Environments"
  display_name = "Environments"
  parent_management_group_id = azurerm_management_group.ims_root.id
}

resource "azurerm_management_group" "sandbox" {
  name         = "Sandbox"
  display_name = "Sandbox"
  parent_management_group_id = azurerm_management_group.ims_root.id
}

resource "azurerm_management_group" "decommissioned" {
  name         = "Decommissioned"
  display_name = "Decommissioned"
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
