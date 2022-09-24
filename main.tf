module "create_RG" {
  source              = "./RG"
  resource_group_name = var.resource_group_name
  location            = var.location

}

module "create_VNETs" {
  source              = "./VNETs"
  resource_group_name = "rg-Hub"
  location            = var.location
  depends_on = [
    module.create_RG
  ]
}

module "create_Subnets" {
  source              = "./Subnets"
  resource_group_name = "rg-Hub"
  depends_on = [
    module.create_VNETs
  ]
}


module "create_VNET_peering" {
  source = "./VNET-Peering"

  vnet_peerings = {
    peering1 = {
      name                      = "Hub-to-Spoke1"
      virtual_network_name      = module.create_VNETs.vnets_out.vnet1.vnet1_name
      remote_virtual_network_id = module.create_VNETs.vnets_out.vnet2.vnet2_id
    }
    peering2 = {
      name                      = "Spoke1-to-Hub"
      virtual_network_name      = module.create_VNETs.vnets_out.vnet2.vnet2_name
      remote_virtual_network_id = module.create_VNETs.vnets_out.vnet1.vnet1_id
    }
    peering3 = {
      name                      = "Hub-to-Spoke2"
      virtual_network_name      = module.create_VNETs.vnets_out.vnet1.vnet1_name
      remote_virtual_network_id = module.create_VNETs.vnets_out.vnet3.vnet3_id
    }
    peering4 = {
      name                      = "Spoke2-to-Hub"
      virtual_network_name      = module.create_VNETs.vnets_out.vnet3.vnet3_name
      remote_virtual_network_id = module.create_VNETs.vnets_out.vnet1.vnet1_id
    }
  }
  depends_on = [
    module.create_VNETs
  ]

}

module "create_NICs" {
  source              = "./NICs"
  resource_group_name = var.resource_group_name
  location            = var.location
  nics = {
    nic_1 = {
      name = "nic_vm1"
      ip_configuration = {
        name                          = "nic_vm1"
        subnet_id                     = module.create_Subnets.subnets_out.subnet2.subnet2_id
        private_ip_address_allocation = "Dynamic"

      }
    }
    nic_2 = {
      name = "nic_vm2"
      ip_configuration = {
        name                          = "nic_vm2"
        subnet_id                     = module.create_Subnets.subnets_out.subnet3.subnet3_id
        private_ip_address_allocation = "Dynamic"

      }
    }
    
  }
  depends_on = [
    module.create_Subnets
  ]
}

module "create_NSGs" {
  source = "./Networksecuritygroup"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet1_id                     = module.create_Subnets.subnets_out.subnet1.subnet1_id
  subnet2_id                     = module.create_Subnets.subnets_out.subnet2.subnet2_id
depends_on = [
  module.create_Subnets
]
}

module "create_VMs" {
    source = "./VM"
    vm_names = ["webserver1","webserver2"]
    resource_group_name = var.resource_group_name
    location = var.location
    nic_id1 =  module.create_NICs.nic_ids_ips.nic_1.nic1_vm1_id
    nic_id2 =  module.create_NICs.nic_ids_ips.nic_2.nic1_vm2_id
    depends_on = [
      module.create_NICs
    ]
    
}

module "create_App-Gateway"{
    source = "./Appgateway"
    pip_name = "lb-pip"
    resource_group_name = var.resource_group_name
    location = var.location
    subnet-frontend-id = module.create_Subnets.subnets_out.subnet1.subnet1_id
    nic_vm1_private_ip_address = "${module.create_NICs.nic_ids_ips.nic_1.nic_vm1_ip}"
    
    nic_vm2_private_ip_address = "${module.create_NICs.nic_ids_ips.nic_2.nic_vm2_ip}"
    depends_on = [
      module.create_VMs,module.create_NICs
    ]
}

module "create_Azurefirewall"{
    source = "./Azurefirewall"
    pip_fw = "fw-pip"
    resource_group_name = var.resource_group_name
    location = var.location
    fw_subnet_id = module.create_Subnets.subnets_out.subnet4.subnet4_id
   # private_ip_id = "${module.create_NICs.nic_ids_ips.nic_3.nic_fw_id}"
    subnets_asso_rt = {
     subnet2= "${module.create_Subnets.subnets_out.subnet2.subnet2_id}"
     subnet3= "${module.create_Subnets.subnets_out.subnet3.subnet3_id}"
    }
    virtual_machine_ip = "${module.create_NICs.nic_ids_ips.nic_1.nic_vm1_ip}"
    depends_on = [
      module.create_Subnets,module.create_NICs
    ]
}