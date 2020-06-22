module "app_service" {
  
  source                    = "github.com/markti/tf_azure_appservice/plan/dedicated"

  name                      = "${var.context.app_name}-${var.context.env_name}"
  resource_group_name       = module.primary_resource_group.name
  location                  = var.primary_location.name
  app_name                  = var.context.app_name
  env_name                  = var.context.env_name

}
module "app_web" {
  
  source                    = "github.com/markti/tf_azure_appservice/app/web"

  name                      = "${var.context.app_name}-${var.context.env_name}"
  resource_group_name       = module.primary_resource_group.name
  location                  = var.primary_location.name
  app_name                  = var.context.app_name
  env_name                  = var.context.env_name
  app_service_plan_id		= module.app_service.id

}
module "primary_resource_group" {
  
  source = "github.com/markti/tf_azure_resourcegroup/base"

  name = "${var.context.app_name}-${var.context.env_name}-app-service"
  location = var.primary_location.name
  app_name = var.context.app_name
  env_name = var.context.env_name

}