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

module "service_plan" {
  source = "git::https://gitlab.sikademo.com/generali/generali-terraform-modules.git//service_plan?ref=webapp"

  name     = "ondrejsika"
  sku_name = "P1v2"
}
