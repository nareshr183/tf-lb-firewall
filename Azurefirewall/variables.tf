variable "resource_group_name" {
    type = string
    
}
variable "location" {
    type = string
 }

 variable "pip_fw" {
    type = string
 }

 variable "allocation_method" {
    type = string
    default = "Static"
 }

 variable "sku" {
    type = string
    default = "Standard"
 }

 variable "fw_name" {
    type = string
    default = "azure-fw"
 }

 variable "sku_tier" {
    type = string
    default = "Standard"
 }

 variable "sku_name" {
    type = string
    default = "AZFW_VNet"
 }

 variable "fw_subnet_id" {
   type = string
 }

variable "subnets_asso_rt" {
   type = map
   default = {}
  
}

variable "virtual_machine_ip" {
type = string

  
}

 /*variable "private_ip_id" {
    type = string
   
 } */