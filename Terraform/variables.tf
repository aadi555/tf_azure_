variable "primary_location" {
  type = object({

    name = string
    suffix = string

  })
}

variable "secondary_location" {
  type = object({

    name = string
    suffix = string

  })
}

variable "app_name" { }
variable "env_name" { }