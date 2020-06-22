
module "primary_resource_group" {
  
  source = "github.com/markti/tf_azure_resourcegroup/base"

  name = "${var.context.app_name}-${var.context.env_name}-backend-${var.location.suffix}"
  location = var.location.name
  app_name = var.context.app_name
  env_name = var.context.env_name

}

module "pbm_storage" {
  
  source              = "github.com/markti/tf_azure_storage/account/secure"

  resource_group_name = module.primary_resource_group.name
  location            = var.location.name
  app_name            = var.context.app_name
  env_name            = var.context.env_name

  name                = "pbm"
  tier                = "Standard"
  type                = "RAGRS"
  secret_prefix       = "PbmStorage-${replace(var.location.name," ", "")}"
  keyvault_id         = var.keyvault_id

}
module "pbm_demo_tenant" {
  
  source                = "github.com/markti/tf_azure_storage/blob/container"

  name                  = "123456789012345"
  storage_account_name  = module.pbm_storage.name

}