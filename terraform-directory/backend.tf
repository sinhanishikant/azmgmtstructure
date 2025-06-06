# This file defines the backend configuration for Terraform state management.
terraform {
backend "azurerm" {
    resource_group_name  = "stateresourcegroup"
    storage_account_name = "practicetfstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
