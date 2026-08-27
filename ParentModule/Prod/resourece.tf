module "rg" {
  source  = "../../Module/RG"
  prod_rg = var.var_rg
}

module "storageacc" {
  depends_on   = [module.rg]
  source       = "../../Module/STORAGE"
  prod_stg_acc = var.var_stg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../Module/VNET"
  prod_vnet  = var.var_vnet
}

module "subnet" {
  depends_on  = [module.rg, module.vnet]
  source      = "../../Module/SUBNET"
  prod_subnet = var.var_subnet
}

module "nsg" {
  depends_on = [module.rg, module.vnet, module.subnet]
  source     = "../../Module/NSG"
  prod_nsg   = var.var_nsg
}

module "pubip" {
  depends_on = [module.rg, module.vnet, module.subnet]
  source     = "../../Module/PUBLIC_IP"
  prod_pubip = var.var_pubip
}

module "vm" {
  depends_on = [module.rg, module.vnet, module.subnet, module.pubip]
  source     = "../../Module/VM"
  prod_vm    = var.var_vm
}