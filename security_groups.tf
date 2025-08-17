# Application Security Groups
resource "azurerm_application_security_group" "db_asg" {
  name                = "asg-db"
  location            = azurerm_resource_group.facets_core.location
  resource_group_name = azurerm_resource_group.facets_core.name
  tags                = var.common_tags
}

resource "azurerm_application_security_group" "app_asg" {
  name                = "asg-app"
  location            = azurerm_resource_group.facets_core.location
  resource_group_name = azurerm_resource_group.facets_core.name
  tags                = var.common_tags
}

resource "azurerm_application_security_group" "vdi_asg" {
  name                = "asg-vdi"
  location            = azurerm_resource_group.facets_core.location
  resource_group_name = azurerm_resource_group.facets_core.name
  tags                = var.common_tags
}

resource "azurerm_application_security_group" "web_asg" {
  name                = "asg-web"
  location            = azurerm_resource_group.facets_core.location
  resource_group_name = azurerm_resource_group.facets_core.name
  tags                = var.common_tags
}

resource "azurerm_application_security_group" "mgmt_asg" {
  name                = "asg-mgmt"
  location            = azurerm_resource_group.facets_core.location
  resource_group_name = azurerm_resource_group.facets_core.name
  tags                = var.common_tags
}
