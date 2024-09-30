terraform {
  backend "http" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "200acaec-2d60-43ad-915a-e8f5352a4ba7"
}
