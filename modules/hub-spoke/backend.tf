 terraform {
 backend "azurerm" {
    resource_group_name  = "stateresourcegroup"
    storage_account_name = "practicetfstorage"
    container_name       = "tfstateoidc"
    key                  = "terraform.tfstateoidc"
  }
 }
