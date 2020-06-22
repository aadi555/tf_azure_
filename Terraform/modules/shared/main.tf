
module "primary_resource_group" {
  
  source = "github.com/markti/tf_azure_resourcegroup/base"

  name = "${var.context.app_name}-${var.context.env_name}-shared"
  location = var.primary_location.name
  app_name = var.context.app_name
  env_name = var.context.env_name

}

module "loganalytics_workspace" {
  
  source              = "github.com/markti/tf_azure_loganalytics/workspace"

  name                = "${var.context.app_name}-${var.context.env_name}"
  resource_group_name = module.primary_resource_group.name
  location            = var.primary_location.name
  app_name            = var.context.app_name
  env_name            = var.context.env_name

}

module "keyvault" {
  
  source                    = "github.com/markti/tf_azure_keyvault/vault/base_v2"

  name                      = "${var.context.app_name}-${var.context.env_name}"
  resource_group_name       = module.primary_resource_group.name
  location                  = var.primary_location.name
  app_name                  = var.context.app_name
  env_name                  = var.context.env_name
  loganalytics_workspace_id = module.loganalytics_workspace.workspace_id

}

data "azurerm_client_config" "current" {
}

module "terraform_admin" {
  
  source                = "github.com/markti/tf_azure_keyvault/policy/machine/admin"

  keyvault_id           = module.keyvault.id
  application_id        = data.azurerm_client_config.current.client_id

}

module "cosmos" {
  
  source                    = "github.com/markti/tf_azure_cosmosdb/account/dual/secure"

  name                      = "${var.context.app_name}-${var.context.env_name}"
  resource_group_name       = module.primary_resource_group.name
  location                  = var.primary_location.name
  failover_location         = var.secondary_location.name
  app_name                  = var.context.app_name
  env_name                  = var.context.env_name
  keyvault_id               = module.keyvault.id
  secret_prefix             = "CosmosDb"

}


module "cosmos_db" {
  
  source                    = "github.com/markti/tf_azure_cosmosdb/database"

  name                      = "erx"
  resource_group_name       = module.primary_resource_group.name
  location                  = var.primary_location.name
  app_name                  = var.context.app_name
  env_name                  = var.context.env_name
  account_name              = module.cosmos.name
  throughput                = "400"

}
