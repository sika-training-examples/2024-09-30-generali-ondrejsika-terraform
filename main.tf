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
  source = "git::https://gitlab.sikademo.com/generali/generali-terraform-modules.git//service_plan?ref=master"

  name     = "ondrejsika"
  sku_name = "P1v2"
}

module "hello_world_webapp" {
  source = "git::https://gitlab.sikademo.com/generali/generali-terraform-modules.git//webapp?ref=master"

  name                = "example-generali-ondrejsika-hello-world"
  resource_group_name = module.service_plan.resource_group_name
  location            = module.service_plan.resource_group_location
  service_plan_id     = module.service_plan.service_plan_id
  docker_image_name   = "ondrejsika/training-example"
  docker_registry_url = "https://docker.io"
}

output "hello_world_url" {
  value = "https://${module.hello_world_webapp.default_hostname}"
}


module "iceland_webapp" {
  source = "git::https://gitlab.sikademo.com/generali/generali-terraform-modules.git//webapp"

  name                = "example-generali-ondrejsika-iceland"
  resource_group_name = module.service_plan.resource_group_name
  location            = module.service_plan.resource_group_location
  service_plan_id     = module.service_plan.service_plan_id
  docker_image_name   = "ondrejsika/iceland-2"
  docker_registry_url = "https://docker.io"
}

output "iceland_url" {
  value = "https://${module.iceland_webapp.default_hostname}"
}
