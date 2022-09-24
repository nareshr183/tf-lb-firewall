resource "azurerm_virtual_machine" "webserver-1" {
  name                  = var.vm_names[0]
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.nic_id1]
  vm_size               = var.vm_size
  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = var.delete_os_disk_on_termination

  # Uncomment this line to delete the data disks automatically when deleting the VM
   delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }
  storage_os_disk {
    name              = var.storage_os_disk1.name
    caching           = var.storage_os_disk1.caching
    create_option     = var.storage_os_disk1.create_option
    managed_disk_type = var.storage_os_disk1.managed_disk_type
  }
  os_profile {
    computer_name  = var.os_profile.computer_name
    admin_username = var.os_profile.admin_username
    admin_password = var.os_profile.admin_password
    custom_data = "${file("user-data-apache-server1.sh")}"
    }
    
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}

# create ubuntu machine 2

resource "azurerm_virtual_machine" "webserver-2" {
  name                  = var.vm_names[1]
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.nic_id2]
  vm_size               = var.vm_size
  #custom_data =file("custom_data2.txt")
  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
   delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }
  storage_os_disk {
    name              = var.storage_os_disk2.name
    caching           = var.storage_os_disk2.caching
    create_option     = var.storage_os_disk2.create_option
    managed_disk_type = var.storage_os_disk2.managed_disk_type
  }
  os_profile {
    computer_name  = var.os_profile2.computer_name
    admin_username = var.os_profile2.admin_username
    admin_password = var.os_profile2.admin_password
    custom_data = "${file("user-data-apache-server2.sh")}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}
