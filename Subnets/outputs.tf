output "subnets_out" {
  value = {
    for k, inst in resource.azurerm_subnet.subnets : k => {
      subnet1_name = (inst.name == "subnet1-vnet1-Hub" ? inst.name : "" )
      subnet1_id = (inst.name == "subnet1-vnet1-Hub" ? inst.id : "" )
      subnet2_name = (inst.name == "subnet1-vnet1-spoke1" ? inst.name : "" )
      subnet2_id = (inst.name == "subnet1-vnet1-spoke1" ? inst.id : "" )
      subnet3_name = (inst.name == "subnet1-vnet1-spoke2" ? inst.name : "" )
      subnet3_id = (inst.name == "subnet1-vnet1-spoke2" ? inst.id : "" )
      subnet4_name = (inst.name == "AzureFirewallSubnet" ? inst.name : "" )
      subnet4_id = (inst.name == "AzureFirewallSubnet" ? inst.id : "" )
            /* 
      name                = inst.name
      id = inst.id
      */
    }
  }
}