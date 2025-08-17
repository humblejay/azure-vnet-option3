variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Facets-VNet"
    Owner       = "Infrastructure Team"
    CreatedBy   = "Terraform"
  }
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Service principal client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Service principal client secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
}
