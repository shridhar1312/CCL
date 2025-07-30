
resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.app_ci}-${var.function_name}-${var.env}"
  s3_bucket     = var.s3_bucket_name
  s3_key        = var.s3_script_key
  handler       = "index.lambda_handler"
  runtime       = var.lambda_runtime
  memory_size   = var.lambda_memory_size
  timeout       = var.lambda_timeout
  ephemeral_storage {
    size = var.ephemeral_size # Set the ephemeral storage size (in MB), max 10 GB
  }


  role = var.iam_role_arn
  # # Dynamically assign IAM role
  # role = each.value.iam_role_arn != null ? each.value.iam_role_arn : aws_iam_role.Harness-ccl-shared_lambda_role.arn

  # Include the layers passed to the module
  layers = var.layers

  environment {
    variables = length(var.environment_variables) > 0 ? var.environment_variables : var.global_environment_variables
  }

  #  vpc_config {
  #   # subnet_ids         = compact([var.app_subnet_a, var.app_subnet_b, var.app_subnet_c != null ? var.app_subnet_c : null])
  #   # subnet_ids         = compact(concat([var.app_subnet_a, var.app_subnet_b], var.app_subnet_c != null ? [var.app_subnet_c] : []))
  #   # subnet_ids           = var.app_subnet_c != null ? [var.app_subnet_a, var.app_subnet_b, var.app_subnet_c] : [var.app_subnet_a, var.app_subnet_b]
  #   subnet_ids         = compact([var.app_subnet_a, var.app_subnet_b, var.app_subnet_c])
  #   security_group_ids = [var.security_group_ids]
  # } 

 vpc_config {
    subnet_ids         = var.enable_vpc ? compact([var.app_subnet_a, var.app_subnet_b, var.app_subnet_c]) : []
    security_group_ids = var.enable_vpc ? var.security_group_ids : null
  } 

  # dynamic "vpc_config" {
  # for_each = var.enable_vpc ? [1] : []
  # content {
  #   subnet_ids         = compact([var.app_subnet_a, var.app_subnet_b, var.app_subnet_c])
  #   security_group_ids = var.security_group_ids
  # } 
  # }

  tags = {
    ApplicationCI        = var.app_ci
    SLALevel             = var.sla_level
    RiskDataClass        = var.risk_data_class
    ApplicationContactDL = var.application_contact_dl
    MaintenanceWindow    = var.maintenance_window
    InternalExternal     = var.internal_external
    DataRetentionPeriod  = var.data_retention_period
    #Name                 = "${var.app_ci}-PHFdataloadingLambda-${var.env}"
    RegulatoryControls   = var.regulatory_controls
    environment         = var.env
  }

  logging_config {
    log_format = "Text"
  }
}



