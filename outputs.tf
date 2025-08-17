output "resource_group_names" {
  description = "Names of all created resource groups"
  value = [
    azurerm_resource_group.facets_core.name,
    azurerm_resource_group.facets_mgmt.name,
    azurerm_resource_group.facets_shared.name,
    azurerm_resource_group.cfg1.name,
    azurerm_resource_group.cfg2.name,
    azurerm_resource_group.cfg3.name,
    azurerm_resource_group.dev1.name,
    azurerm_resource_group.tst1.name,
    azurerm_resource_group.tst2.name,
    azurerm_resource_group.tst3.name,
    azurerm_resource_group.tst4.name,
    azurerm_resource_group.tst5.name,
    azurerm_resource_group.tst6.name
  ]
}

output "virtual_network_name" {
  description = "Name of the created virtual network"
  value       = azurerm_virtual_network.main.name
}

output "virtual_network_id" {
  description = "ID of the created virtual network"
  value       = azurerm_virtual_network.main.id
}

output "virtual_network_address_space" {
  description = "Address space of the virtual network"
  value       = azurerm_virtual_network.main.address_space
}

output "subnet_names" {
  description = "Names of all created subnets"
  value = {
    shared = [
      azurerm_subnet.snet_db_shared.name,
      azurerm_subnet.snet_app_shared.name,
      azurerm_subnet.snet_vdi_shared.name
    ]
    cfg1 = [
      azurerm_subnet.snet_db_cfg1.name,
      azurerm_subnet.snet_app_cfg1.name,
      azurerm_subnet.snet_vdi_cfg1.name
    ]
    cfg2 = [
      azurerm_subnet.snet_db_cfg2.name,
      azurerm_subnet.snet_app_cfg2.name,
      azurerm_subnet.snet_vdi_cfg2.name
    ]
    cfg3 = [
      azurerm_subnet.snet_db_cfg3.name,
      azurerm_subnet.snet_app_cfg3.name,
      azurerm_subnet.snet_vdi_cfg3.name
    ]
    dev1 = [
      azurerm_subnet.snet_db_dev1.name,
      azurerm_subnet.snet_app_dev1.name,
      azurerm_subnet.snet_vdi_dev1.name
    ]
    tst1 = [
      azurerm_subnet.snet_db_tst1.name,
      azurerm_subnet.snet_app_tst1.name,
      azurerm_subnet.snet_vdi_tst1.name
    ]
    tst2 = [
      azurerm_subnet.snet_db_tst2.name,
      azurerm_subnet.snet_app_tst2.name,
      azurerm_subnet.snet_vdi_tst2.name
    ]
    tst3 = [
      azurerm_subnet.snet_db_tst3.name,
      azurerm_subnet.snet_app_tst3.name,
      azurerm_subnet.snet_vdi_tst3.name
    ]
    tst4 = [
      azurerm_subnet.snet_db_tst4.name,
      azurerm_subnet.snet_app_tst4.name,
      azurerm_subnet.snet_vdi_tst4.name
    ]
    tst5 = [
      azurerm_subnet.snet_db_tst5.name,
      azurerm_subnet.snet_app_tst5.name,
      azurerm_subnet.snet_vdi_tst5.name
    ]
    tst6 = [
      azurerm_subnet.snet_db_tst6.name,
      azurerm_subnet.snet_app_tst6.name,
      azurerm_subnet.snet_vdi_tst6.name
    ]
  }
}

output "application_security_group_names" {
  description = "Names of all created application security groups"
  value = [
    azurerm_application_security_group.db_asg.name,
    azurerm_application_security_group.app_asg.name,
    azurerm_application_security_group.vdi_asg.name,
    azurerm_application_security_group.web_asg.name,
    azurerm_application_security_group.mgmt_asg.name
  ]
}
