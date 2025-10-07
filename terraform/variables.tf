variable "location" {
  default     = "East US"
  description = "Azure region for resources"
}

variable "node_count" {
  default     = 1
  description = "Number of AKS nodes"
}

variable "node_size" {
  default     = "Standard_B2s"
  description = "VM size for AKS nodes"
}
