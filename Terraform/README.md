# Introduction 
This is the Terraform project to provision the FDB ePerscription Platform (eRX for short).

# Getting Started
In order to get start you will need to follow these instructions:

1.	Install Terraform
2.	Configure Environment Variables

# Install Terraform
On Windows, using Chocolatey, you can run the following command:

`choco install terraform`

# Configure Environment Variables

|Name|Description|
|--|--|
|ARM_SUBSCRIPTION_ID|Azure Subscription ID|
|ARM_TENANT_ID|Azure Active Directory Tenant ID|
|ARM_CLIENT_ID|Application ID for the Terraform Service Principal (if you have it)|
|ARM_SUBSCRIPTION_ID|Application Client Secret for the Terraform Service Principal (if you have it)|
|ARM_BACKEND_RESOURCE_GROUP_NAME|Azure Resource Group containing the Blob Storage Account used for Terraform State|
|ARM_BACKEND_STORAGE_ACCOUNT_NAME|Azure Blob Storage Account Name used for Terraform State|
|ARM_BACKEND_STORAGE_ACCOUNT_KEY|Azure Blob Storage Account Key used for Terraform State|
|ARM_BACKEND_STORAGE_CONTAINER_NAME|Azure Blob Storage Container used for Terraform State|

## Sample Batch Script
The below script will configure all Environment Variables if you replace 'foo' with the appropriate sensitive data:

call SET ARM_SUBSCRIPTION_ID=foo
call SET ARM_TENANT_ID=foo
call SET ARM_TENANT_ID=foo
call SET ARM_CLIENT_SECRET=foo
call SET ARM_BACKEND_STORAGE_ACCOUNT_KEY=foo

call SET ARM_BACKEND_RESOURCE_GROUP_NAME=fdb-terraform
call SET ARM_BACKEND_STORAGE_ACCOUNT_NAME=fdbterraformdev
call SET ARM_BACKEND_STORAGE_CONTAINER_NAME=erx
call SET DEVOPS_APP_NAME=fdberx
call SET DEVOPS_ENV_NAME=dev

Create a script called "local.bat" and put it in the "scripts" folder. This script is automatically setup to be ignored by Git so you don't have to worry about accidentally checking in credentials!