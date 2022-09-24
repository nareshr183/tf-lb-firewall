resource "azurerm_public_ip" "pip-AGW" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
}

# create application gateway 

resource "azurerm_application_gateway" "lb-AGW" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = var.sku.capacity
  }

  gateway_ip_configuration {
    name      = var.gateway-ip-configuration
    subnet_id = var.subnet-frontend-id
  }

  frontend_port {
    name = var.frontend-port-name
    port = var.frontend-port
  }

  frontend_ip_configuration {
    name                 = var.frontend-ip-name
    public_ip_address_id = azurerm_public_ip.pip-AGW.id
  }

  backend_address_pool {
    name = var.backend-pool-1
   # ip_addresses = ["${azurerm_network_interface.nic_vm1.private_ip_address}","${azurerm_network_interface.nic_vm2.private_ip_address}"]
     ip_addresses = ["${var.nic_vm1_private_ip_address}","${var.nic_vm2_private_ip_address}"]
  }

  backend_address_pool {
    name = var.backend-pool-2
    ip_addresses = ["${var.nic_vm2_private_ip_address}"]
  }

  backend_http_settings {
    name                  = var.backend_http-settings_name
    cookie_based_affinity = var.cookie_based_affinity
    path                  = ""
    port                  = var.frontend-port
    protocol              = var.http_listener_protocol
    request_timeout       = var.backend_http_settings_request_time_out
  }

  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.frontend-ip-name
    frontend_port_name             = var.frontend-port-name
    protocol                       = var.http_listener_protocol
    #type ="Multisite"
  }

  request_routing_rule {
    name                       = var.request_routing_rule.name
    rule_type                  = var.request_routing_rule.rule_type
    http_listener_name         = var.http_listener_name
    url_path_map_name  = var.request_routing_rule.url_path_map_name
    }

    url_path_map {
    name                               = var.request_routing_rule.url_path_map_name
    #default_redirect_configuration_name  = local.url_path_map_name
    default_backend_address_pool_name = var.backend-pool-1
    default_backend_http_settings_name = var.backend_http-settings_name

    path_rule {
      name                        = "women"
      backend_address_pool_name = var.backend-pool-1
      backend_http_settings_name = var.backend_http-settings_name
      paths = [
        "/women/*"
      ]
    }
    path_rule {
      name                        = "men"
      backend_address_pool_name = var.backend-pool-2
      backend_http_settings_name = var.backend_http-settings_name
      paths = [
        "/men/*"
      ]
    }
  }
  
}