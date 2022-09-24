resource "azurerm_subnet" "subnets" {
  for_each = var.subnet_names_address_prefixes
  name                 =each.value["name"]
  resource_group_name  = var.resource_group_name
  virtual_network_name = each.value["vnet-name"]
  address_prefixes     = each.value["address_prefixes"]
  
}
