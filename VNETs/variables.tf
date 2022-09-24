variable "resource_group_name" {
    type = string
    default = "rg-hub"
    
}
variable "location" {
    type = string
    default = "eastus"
  
}

variable "vnet_names_address_spaces" {
    type = map(any)
    default = {
    vnet1 = {
        name = "vnet1-Hub"
        address_space = ["10.0.0.0/16"]
    }
    vnet2 = {
        name = "vnet1-spoke1"
        address_space = ["10.20.0.0/16"]
    }
    vnet3 = {
        name = "vnet1-spoke2"
        address_space = ["10.30.0.0/16"]
    }
  }
  
}

