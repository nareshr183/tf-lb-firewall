variable "nsg-name" {
    type=string
    default = "nsg1"
  
}

variable "resource_group_name" {
  type=string
}

variable "location" {
  type=string
}

variable "subnet1_id" {
  type=string
}

variable "subnet2_id" {
  type=string
}

variable "security_rules" {
  description = "A list of security rules to be created."
  type = map(any)
  default = {
   rule1={
    name                       = "nsg_rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  rule2={
    name                       = "nsg_rule2"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  }
}