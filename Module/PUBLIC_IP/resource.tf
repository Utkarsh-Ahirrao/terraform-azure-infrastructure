resource "azurerm_public_ip" "example" {
  for_each = var.prod_pubip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}