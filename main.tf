resource "azurerm_resource_group" "example" {
  name     = "example-generali-ondrejsika"
  location = "westeurope"
}

resource "azurerm_subnet" "example" {
  name                 = "ondjrejsika"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = "example-generali-network"
  address_prefixes     = ["10.0.1.0/24"]
}
