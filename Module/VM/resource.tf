data "azurerm_subnet" "data_subnet" {
    for_each = var.prod_vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "data-public-ip" {
  for_each = var.prod_vm
  name                = each.value.pubip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "prod_nic" {
    for_each = var.prod_vm
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ipconfig_name
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.data-public-ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "prod_vm" {
    for_each = var.prod_vm
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password    = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [
    azurerm_network_interface.prod_nic[each.key].id,
  ]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
