resource "azurerm_virtual_network_peering" "vnet_peering" {
    for_each = var.vnet_peerings
  name                      = each.value["name"]
  resource_group_name       = var.resource_group_name
  virtual_network_name      = each.value["virtual_network_name"]
  remote_virtual_network_id = each.value["remote_virtual_network_id"]
  
}

