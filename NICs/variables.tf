variable "resource_group_name" {
    type = string
    
}
variable "location" {
    type = string
  
}

variable "nics" {
    type = map(any)
    default = {
    nic_1 = {
        name = "nic_vm1"
        ip_configuration = {
          name                          = "nic_vm1"
          subnet_id                     = ""
          private_ip_address_allocation = "Dynamic"
      
        }
    }
    nic_2 = {
        name = "nic_vm2"
        ip_configuration = {
          name                          = "nic_vm2"
          subnet_id                     = ""
          private_ip_address_allocation = "Dynamic"
      
        }
        
    }
   
  }
  
}





