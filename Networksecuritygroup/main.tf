# create network security group and added one rule to allow all traffic 

 resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg-name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = { for sg in var.security_rules : sg.name => sg } 
  content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = security_rule.value.source_port_range
    destination_port_range     = security_rule.value.destination_port_range
    source_address_prefix      = security_rule.value.source_address_prefix
    destination_address_prefix = security_rule.value.destination_address_prefix
  }
  }
  
  }

  # network security group association with subnet1

  resource "azurerm_subnet_network_security_group_association" "nsg_subnet1_association" {

  subnet_id                 = var.subnet1_id
  network_security_group_id = azurerm_network_security_group.nsg1.id
  depends_on = [azurerm_network_security_group.nsg1]
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet2_association" {

  subnet_id                 = var.subnet2_id
  network_security_group_id = azurerm_network_security_group.nsg1.id
  depends_on = [azurerm_network_security_group.nsg1]
}