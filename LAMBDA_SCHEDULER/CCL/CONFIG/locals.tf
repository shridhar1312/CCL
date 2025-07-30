locals {
  # Define the sequential states
  sequential_states_with_wait = merge(
    {
      for idx, lambda in var.lambda_functions : lambda => {
        "Type"     = "Task",
        "Resource" = "arn:aws:lambda:${var.region}:${var.account_id}:function:${lambda}",
        "Retry" = [
          {
            "ErrorEquals"     = ["States.ALL"], # Retry for any error
            "IntervalSeconds" = 2,
            "MaxAttempts"     = 2,
            "BackoffRate"     = 2.0
          }
        ],
        "Catch" = [
          {
            "ErrorEquals" = ["States.ALL"], # Catch all errors
            "Next"        = (idx + 1 < length(var.lambda_functions)) ? "WaitState-${idx + 1}" : "FinalState"
          }
        ],
        "Next" = "WaitState-${idx + 1}"
      }
    },
    {
      for idx, lambda in var.lambda_functions : "WaitState-${idx + 1}" => {
        "Type"    = "Wait",
        "Seconds" = 30, # Wait for 2 minutes
        "Next"    = (idx + 1 < length(var.lambda_functions)) ? var.lambda_functions[idx + 1] : "FinalState"
      }
    },
    {
      "FinalState" = {
        "Type" = "Succeed"
      }
    }
  )

  # sequential_states = {
  #   for idx, lambda in var.lambda_functions : lambda => {
  #     "Type"       = "Task",
  #     "Resource"   = "arn:aws:lambda:${var.region}:${var.account_id}:function:${lambda}",
  #     "TimeoutSeconds" = 240,  # Timeout for each Lambda execution
  #     "Retry"      = [
  #       {
  #         "ErrorEquals" = ["States.ALL"],  # Retry for any error
  #         "IntervalSeconds" = 2,
  #         "MaxAttempts"     = 2,
  #         "BackoffRate"     = 2.0
  #       }
  #     ],
  #     "Catch"      = [
  #       {
  #         "ErrorEquals" = ["States.ALL"],  # Catch all errors
  #         "Next"        = (idx + 1 < length(var.lambda_functions)) ? var.lambda_functions[idx + 1] : "FinalState"
  #       }
  #     ],
  # #------------Added----------
  #     #"Next"       = (idx + 1 < length(var.lambda_functions)) ? var.lambda_functions[idx + 1] : "FinalState"
  # #----------------------
  #     "Next"       = "WaitState"
  #   }
  # }

  # #-----------ADDED-----------
  # wait_state = {
  #   "Type"     = "Wait",
  #   "Seconds"  = 60,  # Wait for 2 minutes
  #   "Next"     = (idx + 1 < length(var.lambda_functions)) ? var.lambda_functions[idx + 1] : "FinalState"
  # }
  #----------------------



  # Define chunked lambda functions for parallel execution
  chunked_lambda_functions_parallel = [
    for i in range(0, length(var.lambda_functions_parallel), 5) : slice(var.lambda_functions_parallel, i, min(i + 5, length(var.lambda_functions_parallel)))
  ]

  parallel_branches = [
    for idx, chunk in local.chunked_lambda_functions_parallel : {
      "StartAt" = "Chunk_${idx}_start",
      "States" = {
        "Chunk_${idx}_start" = {
          "Type" = "Parallel",
          "Branches" = [
            for lambda in chunk : {
              "StartAt" = "${lambda}_task",
              "States" = {
                # Task state for Lambda
                "${lambda}_task" = {
                  "Type"     = "Task",
                  "Resource" = "arn:aws:lambda:${var.region}:${var.account_id}:function:${lambda}",
                  "End"      = true # Ensure it ends here without requiring a Next field
                }
              }
            }
          ],
          # Remove "End" from the Parallel state if it transitions to another state
          "End" = true
        }
      }
    }
  ]

  # Combine sequential states with parallel execution and final state

  sequential_states_with_end = merge(
    #local.sequential_states,
    local.sequential_states_with_wait,
    {
      # "ParallelExecution" = {
      #   "Type"     = "Parallel",
      #   "Branches" = local.parallel_branches,  # Define parallel branches
      #   "Next"     = "FinalState"
      # },
      "FinalState" = {
        "Type" = "Succeed"
      }
    }
  )
}



#-------------------------------------------------------------------ERROR HANDLING-----------------------------------------



resource "aws_sns_topic" "consolidated_error_notifications" {
  name = "${var.app_ci}-consolidated-error-notifications-${var.env}"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.consolidated_error_notifications.arn
  protocol  = "email"
  endpoint  = "shrirodge96@gmail.com" # Replace with your email
}

resource "aws_cloudwatch_event_rule" "step_function_completion_rule" {
  name        = "${var.app_ci}-step-function-completion-rule-${var.env}"
  description = "Triggers on Step Functions completion"

  event_pattern = jsonencode({
    "source"      = ["aws.states"],
    "detail-type" = ["Step Functions Execution Status Change"],
    "detail" = {
      "stateMachineArn" = [aws_sfn_state_machine.bpr_sequential_execution.arn]
      "status"          = ["SUCCEEDED", "FAILED", "Succeeded", "Failed"]
    }
  })
}


resource "aws_cloudwatch_event_target" "notify_on_failure" {
  rule      = aws_cloudwatch_event_rule.step_function_completion_rule.name
  target_id = "NotifyFailureTarget"
  arn       = aws_lambda_function.log_checker_lambda.arn

}
# can be used for step function execution status but not being used as other logic is more proactive.
# resource "aws_lambda_function" "notify_on_failure" {
#   function_name = "${var.app_ci}-Notification-Lambda-${var.env}"
#   role          = aws_iam_role.lambda_execution_role.arn
#   handler       = "index.lambda_handler"
#   runtime       = "python3.11"
#   s3_bucket   = "ccl-lambdas-artifacts-dev-1234"
#   s3_key      = "Lambda_deployments/notification.zip"
#   timeout     = 120
#   memory_size = 128

#   dead_letter_config {
#     target_arn = aws_sqs_queue.lambda_dlq.arn
#   }

#   ephemeral_storage {
#     size = 512 # Min 512 MB and the Max 10240 MB
#   }

#   environment {
#     variables = {
#       SNS_TOPIC_ARN = aws_sns_topic.consolidated_error_notifications.arn
#     }
#   }

# }

resource "aws_lambda_function" "log_checker_lambda" {
  function_name = "${var.app_ci}-Log-Checker-Lambda-${var.env}"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "index.lambda_handler"
  runtime       = "python3.11"
  s3_bucket   = "ccl-lambdas-artifacts-dev-1234"
  s3_key      = "Lambda_deployments/notification.zip"
  timeout     = 120
  memory_size = 128

  ephemeral_storage {
    size = 512 # Min 512 MB and the Max 10240 MB
  }

  environment {
    variables = {
      SNS_TOPIC_ARN    = aws_sns_topic.consolidated_error_notifications.arn
      LAMBDA_FUNCTIONS = join(",", var.lambda_functions) # Join the list of lambda functions into a comma-separated string

    }
  }

}

resource "aws_iam_role" "lambda_execution_role" {
  name                 = "Harness-${var.app_ci}-notify-lambda-role-${var.env}"
  #permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AppPolicy_Harness"

  #name               = "LambdaExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_execution_policy" {
  #name        = "LambdaExecutionPolicy"
  name = "Harness-${var.app_ci}-notify-lambda-policy-sns-${var.env}"

  description = "IAM Policy for Lambda function to interact with SNS, Step Functions, and CloudWatch"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {

        Effect   = "Allow"
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogGroups", "logs:DescribeLogStreams", "logs:GetLogEvents"]
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect   = "Allow"
        Action   = ["states:DescribeExecution", "states:GetExecutionHistory"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["sns:Publish"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["sqs:SendMessage"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution_policy.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_invoke" {
  statement_id  = "AllowCloudWatchInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.log_checker_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.step_function_completion_rule.arn
}


# Create an SQS Queue to act as a Dead Letter Queue
resource "aws_sqs_queue" "lambda_dlq" {
  name = "${var.app_ci}-notification-lambda-dlq-${var.env}"
}


# Create IAM policy to allow Lambda to write to the SQS DLQ
resource "aws_iam_role_policy" "lambda_dlq_policy" {
  name = "${var.app_ci}-lambda-dlq-policy-${var.env}"

  role = aws_iam_role.lambda_execution_role.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sqs:SendMessage",
        Resource = aws_sqs_queue.lambda_dlq.arn
      }
    ]
  })
}




