provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "ai-infra-rg"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "aiinfraacr2901"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# resource "random_integer" "suffix" {
#   min = 10000
#   max = 99999
# }

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "ai-infra-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aiinfra"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
}


