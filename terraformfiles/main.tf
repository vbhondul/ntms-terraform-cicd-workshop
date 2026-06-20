resource "azurerm_resource_group" "rg" {
  name     = "vaibhav-rg-cicd-ntms-workshop"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vaibhav-vnet-cicd-workshop"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "web-snet" {
  name                 = "web-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_subnet" "app-snet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.1.1.0/24"]
}
