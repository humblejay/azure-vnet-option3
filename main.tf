terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Resource Groups
resource "azurerm_resource_group" "facets_core" {
  name     = "rg-facets-core"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "facets_mgmt" {
  name     = "rg-facets-mgmt"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "facets_shared" {
  name     = "rg-facets-shared"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "cfg1" {
  name     = "rg-cfg1"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "cfg2" {
  name     = "rg-cfg2"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "cfg3" {
  name     = "rg-cfg3"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "dev1" {
  name     = "rg-dev1"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "tst1" {
  name     = "rg-tst1"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "tst2" {
  name     = "rg-tst2"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "tst3" {
  name     = "rg-tst3"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "tst4" {
  name     = "rg-tst4"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "tst5" {
  name     = "rg-tst5"
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_resource_group" "tst6" {
  name     = "rg-tst6"
  location = var.location
  tags     = var.common_tags
}
