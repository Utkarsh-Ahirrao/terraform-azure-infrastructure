terraform{
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version ="5.0.0"
      }
    }
    backend "azurerm" {
      resource_group_name  = "prod_rg_statefile"
      storage_account_name = "prodstg2026"  
      container_name       = "statecontainer"
      key                  = "prod/terraform.tfstate"
    }
}
provider "azurerm" {
  features {}
}