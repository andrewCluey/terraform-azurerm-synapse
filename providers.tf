# Minimum azure provider to use
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.20.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}