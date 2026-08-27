var_rg = {
  rg1 = {
    name     = "resource_group_prod"
    location = "centralindia"
  }
}

var_stg = {
  stg1 = {
    name                     = "stgprodut"
    resource_group_name      = "resource_group_prod"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

var_vnet = {
  vnet1 = {
    name                = "vnet_prod"
    resource_group_name = "resource_group_prod"
    location            = "centralindia"
    address_space       = ["12.0.0.0/16"]
  }
}

var_subnet = {
  subnet1 = {
    name                 = "frontend_prod"
    virtual_network_name = "vnet_prod"
    resource_group_name  = "resource_group_prod"
    address_prefixes     = ["12.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend_prod"
    virtual_network_name = "vnet_prod"
    resource_group_name  = "resource_group_prod"
    address_prefixes     = ["12.0.2.0/24"]
  }
}

var_nsg = {
  nsg = {
    name                = "nsg_prod"
    location            = "centralindia"
    resource_group_name = "resource_group_prod"
  }
}

var_pubip = {
  pubip1 = {
    name                = "frontPublicIp1"
    resource_group_name = "resource_group_prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pubip2 = {
    name                = "backPublicIp1"
    resource_group_name = "resource_group_prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

var_vm = {
  vm1 = {
    name                            = "front_nic_prod"
    location                        = "centralindia"
    resource_group_name             = "resource_group_prod"
    ipconfig_name                   = "front_ipconfig"
    private_ip_address_allocation   = "Dynamic"
    vm_name                         = "frontvm-prod"
    size                            = "Standard_B2as_v2"
    admin_username                  = "adminuser"
    admin_password                  = "naruto@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"

    subnet_name          = "frontend_prod"
    virtual_network_name = "vnet_prod"

    pubip_name = "frontPublicIp1"
  }

  vm2 = {
    name                            = "back_nic_prod"
    location                        = "centralindia"
    resource_group_name             = "resource_group_prod"
    ipconfig_name                   = "back_ipconfig"
    private_ip_address_allocation   = "Dynamic"
    vm_name                         = "backvm-prod"
    size                            = "Standard_B2as_v2"
    admin_username                  = "adminuser"
    admin_password                  = "naruto@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"

    subnet_name          = "backend_prod"
    virtual_network_name = "vnet_prod"

    pubip_name = "backPublicIp1"
  }
}