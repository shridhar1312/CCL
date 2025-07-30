

module "lambda_functions" {
  source          = "../MODULE"
  assume_role_arn = var.assume_role_arn
  role_arn        = var.role_arn
  for_each        = var.lambda_functions
  app_ci          = var.app_ci
  env             = var.env
  lambda_runtime  = each.value.lambda_runtime
  account_id      = var.account_id

  security_group_ids = var.security_group_ids
  app_subnet_a       = var.app_subnet_a
  app_subnet_b       = var.app_subnet_b
  app_subnet_c       = try(each.value.app_subnet_c, null)
  enable_vpc        = lookup(each.value, "enable_vpc", true)
  global_environment_variables = var.global_environment_variables
  environment_variables = try(each.value.environment_variables, {})

  lambda_memory_size = each.value.memory_size
  ephemeral_size     = each.value.ephemeral_size
  lambda_timeout     = each.value.timeout
  function_name      = each.key
  s3_bucket_name     = each.value.s3_bucket
  s3_script_key      = each.value.s3_key
  iam_role_arn       = var.iam_role_arn
  layers             = each.value.layers


}
