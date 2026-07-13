output "instance" {
  description = "contains all web app configuration"
  value = var.instance.type == "linux" ? {
    id                  = azurerm_linux_web_app.this["app"].id
    name                = azurerm_linux_web_app.this["app"].name
    resource_group_name = azurerm_linux_web_app.this["app"].resource_group_name
    location            = azurerm_linux_web_app.this["app"].location
    default_hostname    = azurerm_linux_web_app.this["app"].default_hostname
  } : {
    id                  = azurerm_windows_web_app.this["app"].id
    name                = azurerm_windows_web_app.this["app"].name
    resource_group_name = azurerm_windows_web_app.this["app"].resource_group_name
    location            = azurerm_windows_web_app.this["app"].location
    default_hostname    = azurerm_windows_web_app.this["app"].default_hostname
  }
}

output "slots" {
  description = "contains all web app slot configurations"
  value       = var.instance.type == "linux" ? azurerm_linux_web_app_slot.this : azurerm_windows_web_app_slot.this
}
