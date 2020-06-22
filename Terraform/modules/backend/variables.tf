
variable "location" {
  type = object({

    name = string
    suffix = string

  })
}

variable "context" {
  type = object({

    app_name = string
    env_name = string

  })
}

variable "keyvault_id" { }