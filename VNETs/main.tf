resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnet_names_address_spaces
  name                = each.value["name"]
  address_space       = each.value["address_space"]
  location            = var.location
  resource_group_name = var.resource_group_name
  
}