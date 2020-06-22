
module "primary_resource_group" {
  
  source = "github.com/markti/tf_azure_resourcegroup/base"

  name = "${var.context.app_name}-${var.context.env_name}-frontend"
  location = var.primary_location.name
  app_name = var.context.app_name
  env_name = var.context.env_name

}
