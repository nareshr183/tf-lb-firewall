output "vnet1_details" {
  value = [
    {
      name = module.create_VNETs.vnets_out.vnet1.vnet1_name
      id   = module.create_VNETs.vnets_out.vnet1.vnet1_id
    }
  ]
}

output "vnet2_details" {
  value = [
    {
      name = module.create_VNETs.vnets_out.vnet2.vnet2_name
      id   = module.create_VNETs.vnets_out.vnet2.vnet2_id
    }
  ]
}

output "vnet3_details" {
  value = [
    {
      name = module.create_VNETs.vnets_out.vnet3.vnet3_name
      id   = module.create_VNETs.vnets_out.vnet3.vnet3_id
    }
  ]
}

output "subnet1_details" {
  value = [
    {
      name = module.create_Subnets.subnets_out.subnet1.subnet1_name
      id   = module.create_Subnets.subnets_out.subnet1.subnet1_id
    }
  ]
}

output "subnet2_details" {
  value = [
    {
      name = module.create_Subnets.subnets_out.subnet2.subnet2_name
      id   = module.create_Subnets.subnets_out.subnet2.subnet2_id
    }
  ]
}

output "subnet3_details" {
  value = [
    {
      name = module.create_Subnets.subnets_out.subnet3.subnet3_name
      id   = module.create_Subnets.subnets_out.subnet3.subnet3_id
    }
  ]
}

output "nic_vm1_details" {
  value = [
    {
      ip = module.create_NICs.nic_ids_ips.nic_1.nic_vm1_ip
      id   = module.create_NICs.nic_ids_ips.nic_1.nic1_vm1_id
    }
  ]
}

output "nic_vm2_details" {
  value = [
    {
      ip = module.create_NICs.nic_ids_ips.nic_2.nic_vm2_ip
      id   = module.create_NICs.nic_ids_ips.nic_2.nic1_vm2_id
    }
  ]
}

output "appgateway-pip" {
  value = module.create_App-Gateway.application-gateway_ip
}

output "womens-path" {
  value = module.create_App-Gateway.womens-path
}

output "mens-path" {
  value = module.create_App-Gateway.womens-path
}
