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
subscription_id = "22e6a9c0-f644-43c2-aac9-b756e44d2068"
}

# Hub Resource Group Definition
resource "azurerm_resource_group" "hub-rg" {
  name     = "ims-prod-connectivity-neu-rg-network"
  location = var.location
}

# Hub VNet
resource "azurerm_virtual_network" "hubvnet" {
  name                = "ims-prod-connectivity-neu-vnet-01"
  address_space       = ["192.168.0.0/22"]
  location            = azurerm_resource_group.hub-rg.location
  resource_group_name = azurerm_resource_group.hub-rg.name
}

# Hub Subnet
resource "azurerm_subnet" "hub_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.hub-rg.name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  address_prefixes     = ["192.168.0.0/26"]
}

# Spoke 1 Resource Group Definition
resource "azurerm_resource_group" "spoke1-rg" {
  name     = "ims-prod-management-neu-rg-network"
  location = var.location
}

# Spoke 1 VNet
resource "azurerm_virtual_network" "spoke1vnet" {
  name                = "ims-prod-management-neu-vnet-01"
  address_space       = ["192.168.4.0/22"]
  location            = azurerm_resource_group.spoke1-rg.location
  resource_group_name = azurerm_resource_group.spoke1-rg.name
}

# Spoke 1 Subnet
resource "azurerm_subnet" "spoke1_subnet" {
  name                 = "ims-prod-management-neu-snet-security"
  resource_group_name  = azurerm_resource_group.spoke1-rg.name
  virtual_network_name = azurerm_virtual_network.spoke1vnet.name
  address_prefixes     = ["192.168.4.0/26"]
}

# Spoke 2 VNet
# resource "azurerm_virtual_network" "spoke2" {
#  name                = "spoke2-vnet"
#  address_space       = ["10.2.0.0/16"]
#  location            = azurerm_resource_group.network_rg.location
#  resource_group_name = azurerm_resource_group.network_rg.name
# }

# Spoke 2 Subnet
# resource "azurerm_subnet" "spoke2_subnet" {
#  name                 = "spoke2-subnet"
#  resource_group_name  = azurerm_resource_group.network_rg.name
#  virtual_network_name = azurerm_virtual_network.spoke2.name
#  address_prefixes     = ["10.2.1.0/24"]
# }

# VNet Peering: Hub <-> Spoke1
resource "azurerm_virtual_network_peering" "hub_to_spoke1" {
  name                      = "ims-prod-connectivity-neu-peer-management-01"
  resource_group_name       = azurerm_resource_group.network_rg.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.spoke1.id
  allow_virtual_network_access = true
}

# resource "azurerm_virtual_network_peering" "spoke1_to_hub" {
#  name                      = "spoke1-to-hub"
#  resource_group_name       = azurerm_resource_group.network_rg.name
#  virtual_network_name      = azurerm_virtual_network.spoke1.name
#  remote_virtual_network_id = azurerm_virtual_network.hub.id
#  allow_virtual_network_access = true
# }

# VNet Peering: Hub <-> Spoke2
# resource "azurerm_virtual_network_peering" "hub_to_spoke2" {
#  name                      = "hub-to-spoke2"
#  resource_group_name       = azurerm_resource_group.network_rg.name
#  virtual_network_name      = azurerm_virtual_network.hub.name
#  remote_virtual_network_id = azurerm_virtual_network.spoke2.id
#  allow_virtual_network_access = true
# }

# resource "azurerm_virtual_network_peering" "spoke2_to_hub" {
#  name                      = "spoke2-to-hub"
#  resource_group_name       = azurerm_resource_group.network_rg.name
#  virtual_network_name      = azurerm_virtual_network.spoke2.name
#  remote_virtual_network_id = azurerm_virtual_network.hub.id
#  allow_virtual_network_access = true
# }
