provider "aws" {
  region = var.region
  # assume_role {
  #   role_arn = var.assume_role_arn
  # }
  default_tags {
    tags = {
      app_ci       = var.app_ci
      env          = var.env
      triggered_by = "Terraform",
      created_by   = "Terraform",
    }
  }
}