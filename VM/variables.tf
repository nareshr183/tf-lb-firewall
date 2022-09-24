
variable "resource_group_name" {
    type = string
    
}
variable "location" {
    type = string
  
}

variable "nic_id1" {
    type = string
  
}

variable "nic_id2" {
    type = string
  
}
variable "ip_address_allocation" {
    type = string
    default = "Dynamic"
  
}

variable "vm_names" {
    type = list
    default = ["ubuntu_vm1","ubuntu_vm2"]
    
  
}

variable "vm_size" {
    type = string
    default = "Standard_B1ms"
  
}

variable "delete_os_disk_on_termination" {
    type = bool
    default = true
  
}

variable "delete_data_disks_on_termination" {
  type = bool
  default = true
}

variable "os_profile" {
    type = map(any)
    default = {
    computer_name  = "webserver-1"
    admin_username = "naresh"
    admin_password = "Saibaba@2834"
  }
}

variable "os_profile2" {
    type = map(any)
    default = {
    computer_name  = "webserver-1"
    admin_username = "naresh"
    admin_password = "Saibaba@2834"
  }
  
}

variable "storage_image_reference" {
    type = map(any)
    default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  
}

variable "storage_os_disk1" {
type = map(any)
    default = {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }
  
}

variable "storage_os_disk2" {
type = map(any)
    default = {
    name              = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }
  
}





