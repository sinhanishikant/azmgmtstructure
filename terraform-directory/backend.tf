# This file defines the backend configuration for Terraform state management.
terraform {
backend "azurerm" {
    resource_group_name  = "stateresourcegroup"
    storage_account_name = "practicetfstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "${var.backend_resource_group_name}"
    storage_account_name = "${var.backend_storage_account_name}"
    container_name       = "${var.backend_container_name}"
    key                  = "${var.backend_key}" # Path to the state file in the container
  }
}

provider "azurerm" {
  features {}
}
