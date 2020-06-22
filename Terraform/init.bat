REM rmdir /Q /S .\.terraform\modules

call SET ARM_BACKEND_RESOURCE_GROUP_NAME=fdb-terraform
call SET ARM_BACKEND_STORAGE_ACCOUNT_NAME=fdbterraformdev
call SET ARM_BACKEND_STORAGE_CONTAINER_NAME=erx

call SET DEVOPS_APP_NAME=fdberx
call SET DEVOPS_ENV_NAME=dev

call echo %DEVOPS_APP_NAME%
call echo %DEVOPS_ENV_NAME%
call echo %ARM_CLIENT_ID%

call terraform init -backend-config="resource_group_name=%ARM_BACKEND_RESOURCE_GROUP_NAME%" -backend-config="storage_account_name=%ARM_BACKEND_STORAGE_ACCOUNT_NAME%" -backend-config="container_name=%ARM_BACKEND_STORAGE_CONTAINER_NAME%" -backend-config="access_key=%ARM_BACKEND_STORAGE_ACCOUNT_KEY%" -backend-config="key=%DEVOPS_APP_NAME%"

