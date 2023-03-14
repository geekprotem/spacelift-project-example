
module "space" {
  source = "spacelift.io/YOUR_GITHUB_ACCOUNT/subspace/spacelift"
  version = "0.0.2"

  name = var.project_name
  description = var.space_description
  space_path = var.space_path
  envvars = merge(
    {
    "TF_VAR_project" = {
      value = var.project_name
    },
    "spacelift_managed" = {
      value = "true"
    },
    "TF_VAR_space_path" = {
      value = "${var.space_path}/${var.project_name}"
    }
    },
    var.space_vars
  )
}

module "project-stack" {
  source  = "spacelift.io/YOUR_GITHUB_ACCOUNT/substack/spacelift"
  version = "0.0.3"

  for_each = var.stacks

  name = "${var.project_name}-${each.key}"
  description = each.value.description
  space_id = module.space.space_id
  administrative = "false"
  terraform = each.value.terraform
  autodeploy = each.value.autodeploy

  repository = each.value.repository
  branch = each.value.branch
  path = each.value.path

  context_id = module.space.context_id
  integration_role_arn = var.integration_role_arn
  additional_context_labels = each.value.additional_context_labels
  envvars = each.value.envvars
}
