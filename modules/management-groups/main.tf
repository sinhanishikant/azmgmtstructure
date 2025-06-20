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
