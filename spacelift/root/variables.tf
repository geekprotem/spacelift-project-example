
variable "project_name" {
  type = string
  description = "the name of the project"
}

variable "space_description" {
  type = string
  description = "the description of the space to make"
}

variable "space_path" {
  type = string
  description = "the parent path of the space to make"
}

variable "integration_role_arn" {
  type = list(string)
  description = "the cloud integration to use"
  default = []
}

variable "space_vars" {
  description = "environment variables to set in the spacewide context"
  type = map(
    object({
      value = string
    })
  )
  default = {
    "spacelift_managed" = {
      value = "true"
    }
  }
}

variable "stacks" {
  type = map(
    object({
      description = string
      administrative = string
      terraform = string
      autodeploy = string
      repository = string
      branch = string
      path = string
      autodeploy = string
      additional_context_labels = list(string)
      envvars = map(
        object({
          value = string
        })
      )
    })
  )
}
