output "vnets_out" {
  value = {
    for k, inst in resource.azurerm_virtual_network.vnets : k => {
      vnet1_name = (inst.name == "vnet1-Hub" ? inst.name : "" )
      vnet1_id = (inst.name == "vnet1-Hub" ? inst.id : "" )
      vnet2_name = (inst.name == "vnet1-spoke1" ? inst.name : "" )
      vnet2_id = (inst.name == "vnet1-spoke1" ? inst.id : "" )
      vnet3_name = (inst.name == "vnet1-spoke2" ? inst.name : "" )
      vnet3_id = (inst.name == "vnet1-spoke2" ? inst.id : "" )
     
      /* 
      name                = inst.name
      id = inst.id
      */
    }
  }
}