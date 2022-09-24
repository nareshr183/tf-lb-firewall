variable "resource_group_name" {
    type = string
    default = "rg-hub"
    
}

variable "vnet_peerings" {
    type = map(any)
    default = {
    peering1 = {
        name = "Hub-to-Spoke1"
        virtual_network_name      = ""
        remote_virtual_network_id = ""
    }
    peering2 = {
         name = "Spoke1-to-Hub"
        virtual_network_name      = ""
        remote_virtual_network_id = ""
    }
    
  }
  
}

