variable "pip_name" {
  type = string
}

variable "resource_group_name" {
    type = string
    
}
variable "location" {
    type = string
  
}

variable "allocation_method" {
    type = string
    default = "Dynamic"
  
}

variable "lb_name" {
    type = string
    default = "appgateway"
  
}
variable "gateway-ip-configuration" {
    type = string
    default = "gateway-ip-configuration"
  
}
variable "subnet-frontend-id" {
    type = string
  
}

variable "frontend-port-name" {
    type = string
    default = "frontend-port"
  
}

variable "frontend-port" {
    type = string
    default = 80
  
}

variable "frontend-ip-name" {
    type = string
    default = "frontend-ip"
  
}

variable "backend-pool-1" {
    type = string
    default = "backend-pool-1"
  
}

variable "backend-pool-2" {
    type = string
    default = "backend-pool-2"
  
}

variable "nic_vm1_private_ip_address" {
  type = string
}

variable "nic_vm2_private_ip_address" {
  type = string
}

variable "backend_http-settings_name" {
    type = string
    default = "http-settings"
  
}

variable "cookie_based_affinity" {
    type = string
    default = "Disabled"
  
}

variable "http_listener_name" {
    type = string
    default = "Listener"
  
}

variable "http_listener_protocol" {
    type = string
    default = "Http"
  
}

variable "sku" {
type = map(any)
    default = {
     name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
    }
  
}

variable "backend_http_settings_request_time_out" {
    type = number
    default = 60
  
}

variable "request_routing_rule" {
type = map(any)
    default = {
    name                       = "route-rule1"
    rule_type                  = "PathBasedRouting"
    url_path_map_name  = "url-path-map"
    }
  
}