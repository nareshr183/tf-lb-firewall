output "application-gateway_ip" {
  value = azurerm_public_ip.pip-AGW.ip_address
}

output "womens-path" {
  value = "/women/*"
}

output "mens-path" {
  value = "/men/*"
}