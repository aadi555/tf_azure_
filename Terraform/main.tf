
locals {
  context = {
    app_name = var.app_name
    env_name = var.env_name
  }
}

# Multi-regional Services (i.e. CosmosDB, KeyVault, API Management)
module "backend_shared" {
  
  source              = "./modules/shared"

  primary_location    = var.primary_location
  secondary_location  = var.secondary_location
  context             = local.context

}

# Azure Function Service Plans, Azure Function Apps, Storage Accounts, Data Factories
# US-EAST
module "backend_primary" {
  
  source        = "./modules/backend"

  location      = var.primary_location
  context       = local.context
  keyvault_id   = module.backend_shared.keyvault_id

}

# US-EAST
module "backend_secondary" {
  
  source        = "./modules/backend"

  location      = var.secondary_location
  context       = local.context
  keyvault_id   = module.backend_shared.keyvault_id

}
