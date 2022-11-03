provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "rg" {
  name     = "rg-test-synapse"
  location = "uksouth"
}

module "synapse" {
  source  = ""
  version = ""

  workspace_name                       = ""
  resource_group_name                  = ""
  storage_data_lake_gen2_filesystem_id = ""

}
