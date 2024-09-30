resource "azurerm_resource_group" "example" {
  name     = "example-generali-ondrejsika"
  location = "westeurope"
}

data "azurerm_subnet" "ondrejsika" {
  name                 = "ondrejsika"
  virtual_network_name = "example-generali-network"
  resource_group_name  = "example-generali-network"
}

output "subnet_id" {
  value = data.azurerm_subnet.ondrejsika.id
}
