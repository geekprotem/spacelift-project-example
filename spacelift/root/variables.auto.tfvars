
project_name = "SOME_NAME"

space_description = "SOME_DESCRIPTION"

space_path = "root/projects"

# integration_role_arn = [""]

space_vars = {
  "TF_VAR_region" = {
    value = "SOME_REGION"
  }
}

stacks = {
  "common" = {
    description = "common resources"
    terraform = "1.4.0"
    administrative = "false"
    repository = "SOME_REPO"
    branch = "main"
    path = "spacelift/common"
    autodeploy = "true"
    additional_context_labels = [
      "aws_credentials"
    ]
    envvars = {
      "TF_VAR_environment" = {
        value = "common"
      }
    }
  },
  "development" = {
    description = "development resources"
    terraform = "1.4.0"
    administrative = "false"
    repository = "SOME_REPO"
    branch = "main"
    path = "spacelift/development"
    autodeploy = "true"
    additional_context_labels = [
      "aws_credentials"
    ]
    envvars = {
      "TF_VAR_environment" = {
        value = "development"
      }
    }
  },
  "production" = {
    description = "production resources"
    terraform = "1.4.0"
    administrative = "false"
    repository = "SOME_REPO"
    branch = "main"
    path = "spacelift/production"
    autodeploy = "false"
    additional_context_labels = [
      "aws_credentials"
    ]
    envvars = {
      "TF_VAR_environment" = {
        value = "production"
      }
    }
  }
}
