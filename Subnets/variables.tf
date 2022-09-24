variable "resource_group_name" {
    type = string
    default = "value"
  
}

variable "vnet_name" {
    type = string
  default = "value"
}




variable "subnet_names_address_prefixes" {
    
    type = map(any)
    default = {
    subnet1 = {
        name = "subnet1-vnet1-Hub"
        address_prefixes = ["10.0.0.0/24"]
        vnet-name = "vnet1-Hub"
       
    }
    subnet2 = {
        name = "subnet1-vnet1-spoke1"
        address_prefixes = ["10.20.0.0/24"]
        vnet-name = "vnet1-spoke1"
       
    }
    subnet3 = {
        name = "subnet1-vnet1-spoke2"
        address_prefixes = ["10.30.0.0/24"]
        vnet-name = "vnet1-spoke2"
       
    }
    subnet4 = {
        name = "AzureFirewallSubnet"
        address_prefixes = ["10.0.1.0/24"]
        vnet-name = "vnet1-Hub"
       
    }
    
  }
  
} 
