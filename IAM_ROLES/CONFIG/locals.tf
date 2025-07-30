locals {
  account_id  = data.aws_caller_identity.current.account_id
  name_prefix = "harness"

  tags = {
    ApplicationCI = var.app_ci
    env           = var.env
    region        = var.region
  }
}
