# create public ip for azure firewall

resource "azurerm_public_ip" "pip_fw" {
  name                = var.pip_fw
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

# create azure firewall

resource "azurerm_firewall" "fw-azure" {
  name                = var.fw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  sku_tier            = var.sku

  ip_configuration {
    name                 = var.fw_name
    subnet_id            = var.fw_subnet_id
    public_ip_address_id = azurerm_public_ip.pip_fw.id
    #private_ip_address_id = var.private_ip_id
  }
}

# private ip of azure firewall

data "azurerm_firewall" "fw_private_ip" {
  name                = azurerm_firewall.fw-azure.name
  resource_group_name = var.resource_group_name
}

# public ip of azure firewall

data "azurerm_firewall" "fw_public_ip" {
  name                = azurerm_firewall.fw-azure.name
  resource_group_name = var.resource_group_name
}

# create route table and one route to the Firewall

resource "azurerm_route_table" "routetable1" {
  name                          = "routetable1"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name           = "route1"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
	next_hop_in_ip_address = "${data.azurerm_firewall.fw_private_ip.ip_configuration.0.private_ip_address}"
  }
}

resource "azurerm_subnet_route_table_association" "rt_association_subnets" {
  for_each = var.subnets_asso_rt
  subnet_id      = each.value
  route_table_id = azurerm_route_table.routetable1.id
}

# application rule allow google.com
/*
resource "azurerm_firewall_application_rule_collection" "app-rul2" {
  name="app-rule2"
  azure_firewall_name = azurerm_firewall.fw-azure.name
  resource_group_name = var.resource_group_name
  priority = 201
  action = "Allow"
   rule {
     name = "Allo_g_m"
     source_addresses = ["10.20.0.0/16",]
     target_fqdns = ["*.google.com","*.microsoft.com",]
     protocol {
       port = "443"
       type = "Https"
     }
     protocol {
       port = "80"
       type = "Http"
     }
   }
}
/*
resource "azurerm_firewall_application_rule_collection" "app-rule1" {
  name                = "app-rule1"
  azure_firewall_name = azurerm_firewall.fw-azure.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  rule {
    name = "Allow_google_microsoft"

    source_addresses = [
      "10.20.0.0/16",
    ]

    target_fqdns = [
      "*.google.com","*.microsoft.com"
    ]

    protocol {
      port = "443"
      type = "Https"
    }
    protocol {
      port = "80"
      type = "Http"
    }
  }
}

# nat rule adding 

resource "azurerm_firewall_nat_rule_collection" "dest-natrule1" {
  name                = "dest-natrule1"
  azure_firewall_name = azurerm_firewall.fw-azure.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Dnat"

  rule {
    name = "dnatrule1"

    source_addresses = [
      "*",
    ]

    destination_ports = [
      "53",
    ]

    destination_addresses = [
      azurerm_public_ip.pip_fw.ip_address
    ]

    translated_port = 53

    translated_address = var.virtual_machine_ip

    protocols = [
      "TCP",
      "UDP",
      "ICMP",
      
    ]
  }
} */

