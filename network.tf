# Virtual Network - Using /16 to accommodate all required subnets
resource "azurerm_virtual_network" "main" {
  name                = "vnet-facets-core"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.facets_core.location
  resource_group_name = azurerm_resource_group.facets_core.name
  tags                = var.common_tags
}

# Subnets for shared resources
resource "azurerm_subnet" "snet_db_shared" {
  name                 = "snet-db-shared"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/26"]
}

resource "azurerm_subnet" "snet_app_shared" {
  name                 = "snet-app-shared"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "snet_vdi_shared" {
  name                 = "snet-vdi-shared"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.4.0/22"]
}

# Subnets for cfg1
resource "azurerm_subnet" "snet_db_cfg1" {
  name                 = "snet-db-cfg1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.64/26"]
}

resource "azurerm_subnet" "snet_app_cfg1" {
  name                 = "snet-app-cfg1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "snet_vdi_cfg1" {
  name                 = "snet-vdi-cfg1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.8.0/22"]
}

# Subnets for cfg2
resource "azurerm_subnet" "snet_db_cfg2" {
  name                 = "snet-db-cfg2"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.128/26"]
}

resource "azurerm_subnet" "snet_app_cfg2" {
  name                 = "snet-app-cfg2"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "snet_vdi_cfg2" {
  name                 = "snet-vdi-cfg2"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.12.0/22"]
}

# Subnets for cfg3
resource "azurerm_subnet" "snet_db_cfg3" {
  name                 = "snet-db-cfg3"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.192/26"]
}

resource "azurerm_subnet" "snet_app_cfg3" {
  name                 = "snet-app-cfg3"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.15.0/24"]
}

resource "azurerm_subnet" "snet_vdi_cfg3" {
  name                 = "snet-vdi-cfg3"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.16.0/22"]
}

# Subnets for dev1
resource "azurerm_subnet" "snet_db_dev1" {
  name                 = "snet-db-dev1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.56.0/26"]
}

resource "azurerm_subnet" "snet_app_dev1" {
  name                 = "snet-app-dev1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.57.0/24"]
}

resource "azurerm_subnet" "snet_vdi_dev1" {
  name                 = "snet-vdi-dev1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.60.0/22"]
}

# Subnets for tst1
resource "azurerm_subnet" "snet_db_tst1" {
  name                 = "snet-db-tst1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.64.0/26"]
}

resource "azurerm_subnet" "snet_app_tst1" {
  name                 = "snet-app-tst1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.65.0/24"]
}

resource "azurerm_subnet" "snet_vdi_tst1" {
  name                 = "snet-vdi-tst1"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.68.0/22"]
}

# Subnets for tst2
resource "azurerm_subnet" "snet_db_tst2" {
  name                 = "snet-db-tst2"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.72.0/26"]
}

resource "azurerm_subnet" "snet_app_tst2" {
  name                 = "snet-app-tst2"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.73.0/24"]
}

resource "azurerm_subnet" "snet_vdi_tst2" {
  name                 = "snet-vdi-tst2"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.76.0/22"]
}

# Subnets for tst3
resource "azurerm_subnet" "snet_db_tst3" {
  name                 = "snet-db-tst3"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.80.0/26"]
}

resource "azurerm_subnet" "snet_app_tst3" {
  name                 = "snet-app-tst3"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.81.0/24"]
}

resource "azurerm_subnet" "snet_vdi_tst3" {
  name                 = "snet-vdi-tst3"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.84.0/22"]
}

# Subnets for tst4
resource "azurerm_subnet" "snet_db_tst4" {
  name                 = "snet-db-tst4"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.88.0/26"]
}

resource "azurerm_subnet" "snet_app_tst4" {
  name                 = "snet-app-tst4"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.89.0/24"]
}

resource "azurerm_subnet" "snet_vdi_tst4" {
  name                 = "snet-vdi-tst4"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.92.0/22"]
}

# Subnets for tst5
resource "azurerm_subnet" "snet_db_tst5" {
  name                 = "snet-db-tst5"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.96.0/26"]
}

resource "azurerm_subnet" "snet_app_tst5" {
  name                 = "snet-app-tst5"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.97.0/24"]
}

resource "azurerm_subnet" "snet_vdi_tst5" {
  name                 = "snet-vdi-tst5"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.100.0/22"]
}

# Subnets for tst6
resource "azurerm_subnet" "snet_db_tst6" {
  name                 = "snet-db-tst6"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.104.0/26"]
}

resource "azurerm_subnet" "snet_app_tst6" {
  name                 = "snet-app-tst6"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.105.0/24"]
}

resource "azurerm_subnet" "snet_vdi_tst6" {
  name                 = "snet-vdi-tst6"
  resource_group_name  = azurerm_resource_group.facets_core.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.108.0/22"]
}
