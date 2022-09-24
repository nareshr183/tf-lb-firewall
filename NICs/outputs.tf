output "nic_ids_ips" {
  value = {
    for k, inst in resource.azurerm_network_interface.nics : k => {
      nic_vm1_ip = (inst.name == "nic_vm1" ? inst.private_ip_address : "" )
      nic1_vm1_id = (inst.name == "nic_vm1" ? inst.id : "" )
      nic_vm2_ip = (inst.name == "nic_vm2" ? inst.private_ip_address : "" )
      nic1_vm2_id = (inst.name == "nic_vm2" ? inst.id : "" )
     
            /* 
      name                = inst.name
      id = inst.id
      */
    }
  }
}
/*
output "nic_id2" {
  value = azurerm_network_interface.nic_vm2.id
}

output "nic_vm1_private_ip_address" {
  value = azurerm_network_interface.nic_vm1.private_ip_address
  
}

output "nic_vm2_private_ip_address" {
  value = azurerm_network_interface.nic_vm2.private_ip_address
  
} */