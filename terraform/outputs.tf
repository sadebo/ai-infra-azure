output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "acr_name" {
  description = "Azure Container Registry name"
  value       = azurerm_container_registry.acr.name
}

output "azurerm_resource_group" {
    description = "Azure resource group"
    value     = azurerm_resource_group.rg.name
}