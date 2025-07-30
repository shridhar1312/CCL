# IAM Role for Step Functions
resource "aws_iam_role" "step_function_role" {
  name                 = "Harness-${var.app_ci}-${var.env}-StepFunctionRole"
  #permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AppPolicy_Harness"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "states.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "attach_cloudwatch_full_access" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}



#----------------------------------------------

# CloudWatch Log Group for Step Functions
resource "aws_cloudwatch_log_group" "sfn_log_group" {
  name              = "/aws/stepfunctions/bpr-sequential-execution-logs"
  retention_in_days = 7 # Set the retention period based on your needs
}

# Allow Step Functions to log to the CloudWatch log group
resource "aws_cloudwatch_log_resource_policy" "allow_step_functions_logging" {
  policy_name = "Harness-${var.app_ci}-${var.env}-AllowStepFunctionsLogging-policy"
  policy_document = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "states.amazonaws.com"
        },
        "Action" : [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "${aws_cloudwatch_log_group.sfn_log_group.arn}"
      }
    ]
  })
}

#----------------------------------------------

# Step Functions State Machine with sequential and parallel execution
resource "aws_sfn_state_machine" "bpr_sequential_execution" {
  name     = "bpr-sequential-execution"
  role_arn = aws_iam_role.step_function_role.arn

  definition = jsonencode({
    "StartAt" = var.lambda_functions[0],         # Ensure the first state is defined
    "States"  = local.sequential_states_with_end # Use the updated states with transitions
  })

  logging_configuration {
    log_destination        = "${aws_cloudwatch_log_group.sfn_log_group.arn}:*"
    include_execution_data = true
    level                  = "ERROR"
  }
}


#----------------------------------------------


# Allow Step Functions to invoke Lambda functions sequentially
# IAM Policy to Allow Lambda Invocation
resource "aws_iam_policy" "allow_step_function_invoke_lambda" {
  name        = "Harness-${var.app_ci}-${var.env}-AllowStepFunctionInvokeLambda"
  description = "Policy to allow Step Functions to invoke specific Lambda functions."

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "lambda:InvokeFunction",
        "Resource" : [
          #for function_name in var.lambda_functions : "arn:aws:lambda:${var.region}:${var.account_id}:function:${function_name}"
          "arn:aws:lambda:${var.region}:${var.account_id}:function:ccl-*",

        ]
      }
    ]
  })
}

# IAM Policy to Allow Parallel Lambda Invocation
# resource "aws_iam_policy" "allow_step_function_invoke_lambda_parallel" {
#   name        = "Harness-${var.app_ci}-${var.env}-AllowStepFunctionInvokeLambdaParallel"

#   description = "Policy to allow Step Functions to invoke specific parallel Lambda functions."

#   policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Effect": "Allow",
#         "Action": "lambda:InvokeFunction",
#         "Resource": [
#           for function_name in var.lambda_functions_parallel : "arn:aws:lambda:${var.region}:${var.account_id}:function:${function_name}"
#         ]
#       }
#     ]
#   })
# }

resource "aws_iam_policy" "allow_step_function_invoke_lambda_parallel" {
  name        = "Harness-${var.app_ci}-${var.env}-AllowStepFunctionInvokeLambdaParallel"
  description = "Policy to allow Step Functions to invoke specific parallel Lambda functions."

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "lambda:InvokeFunction",
        "Resource" : [

          "arn:aws:lambda:${var.region}:${var.account_id}:function:ccl-*dataloadingLambda-${var.env}",          # Match lambdas like ccl-HofConLambdadataloading-qa
          "arn:aws:lambda:${var.region}:${var.account_id}:function:ccl-*DataLoading*dynamodblambda-${var.env}", # Match lambdas like ccl-TTR1DataLoadingdynamodblambda-qa
          "arn:aws:lambda:${var.region}:${var.account_id}:function:ccl-*Lambdadataloading-${var.env}",          # General matching for lambdas ending in Lambdadataloading-qa
          "arn:aws:lambda:${var.region}:${var.account_id}:function:ccl-*dataloadingdynamodblambda-${var.env}",  # Covering all *dataloadingdynamodblambda-qa
          "arn:aws:lambda:${var.region}:${var.account_id}:function:ccl-*",
        ]
      }
    ]
  })
}


# Attach Lambda Invoke Policy to Step Function Role
resource "aws_iam_role_policy_attachment" "attach_lambda_invoke_policy" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.allow_step_function_invoke_lambda.arn
}

# Attach Lambda Invoke Policy for Parallel Invocations
resource "aws_iam_role_policy_attachment" "attach_lambda_invoke_policy_parallel" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.allow_step_function_invoke_lambda_parallel.arn
}


#----------------------------------------------


resource "aws_cloudwatch_event_rule" "bpr_sequential_schedule" {
  name = "${var.app_ci}-${var.env}-LambdaScheduler-EventRule"
  #schedule_expression = "cron(10 1 * * ? *)" 
  schedule_expression = var.schedule_expression
  is_enabled          = true
  #is_enabled          = var.env == "dev" ? false : true

}

# CloudWatch Event Target to trigger Step Functions
resource "aws_cloudwatch_event_target" "bpr_sequential_target" {
  rule     = aws_cloudwatch_event_rule.bpr_sequential_schedule.name
  arn      = aws_sfn_state_machine.bpr_sequential_execution.arn
  role_arn = aws_iam_role.cloudwatch_events_role.arn # Use the CloudWatch Events role
}

#----------------------------------------------

# IAM Role for CloudWatch Events to invoke Step Functions
resource "aws_iam_role" "cloudwatch_events_role" {
  name                 = "Harness-${var.app_ci}-${var.env}-CloudWatchEventsRole"
  #permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AppPolicy_Harness"


  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "events.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
}

# IAM Policy to allow CloudWatch Events to invoke Step Functions
resource "aws_iam_policy" "cloudwatch_event_policy" {
  name        = "Harness-${var.app_ci}-${var.env}-CloudWatchEventPolicy"
  description = "Policy for CloudWatch Events to invoke Step Functions"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "states:StartExecution",
        "Resource" : aws_sfn_state_machine.bpr_sequential_execution.arn
      }
    ]
  })
}

# Attach CloudWatch Event policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach_cloudwatch_event_policy" {
  role       = aws_iam_role.cloudwatch_events_role.name
  policy_arn = aws_iam_policy.cloudwatch_event_policy.arn
}
