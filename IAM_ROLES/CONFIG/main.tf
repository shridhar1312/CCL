resource "aws_lambda_layer_version" "publish_ccl_request_lambda_layer" {
  layer_name          = "${var.app_ci}-request-lambda-layer-${var.env}"                  # Name of the Lambda layer
  filename            = "./ccl-request-layer.zip"                                        # Path to the ZIP file in the same directory
  compatible_runtimes = ["python3.8", "python3.9"]                                       # Specify the runtimes compatible with the layer
  description         = "Custom Lambda Layer with dependencies ccl_request_lambda_laye " # Add an appropriate description
}

resource "aws_lambda_layer_version" "publish_ccl_paramiko_lambda_layer" {
  layer_name          = "${var.app_ci}-paramiko-lambda-layer-${var.env}"           # Name of the Lambda layer
  filename            = "./ccl-paramiko-ek.zip"                                    # Path to the ZIP file in the same directory
  compatible_runtimes = ["python3.11"]                                             # Specify the runtimes compatible with the layer
  description         = "Custom Lambda Layer with dependencies ccl-paramiko-layer" # Add an appropriate description
}


resource "aws_iam_role" "Harness-ccl-shared_lambda_role" {
  name                 = "Harness-${var.app_ci}-shared-lambda-role-${var.env}"
  #permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AppPolicy_Harness"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
  tags = {
    Name          = "Harness-${var.app_ci}-shared-role-${var.env}"
    ApplicationCI = var.app_ci
  }
}

resource "aws_iam_role_policy_attachment" "shared_lambda_vpc_access" {
  role       = aws_iam_role.Harness-ccl-shared_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}


resource "aws_iam_role_policy_attachment" "shared_lambda_dynamodb_access" {
  role       = aws_iam_role.Harness-ccl-shared_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole"
}

resource "aws_iam_policy" "Harness-shared-lambda-policy-sns-sqs-dynamodb-s3" {
  name = "Harness-shared-lambda-policy-sns-sqs-dynamodb-s3-${var.app_ci}-${var.env}"

  description = "Policy for Lambda functions ${var.app_ci}-${var.env}"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "LambdaSNS"
        Effect = "Allow"
        Action = [
          "sns:ListSubscriptionsByTopic",
          "sns:GetTopicAttributes",
          "sns:ListTagsForResource",
          "sns:TagResource",
          "sns:UntagResource",
          "sns:Publish",
          "sns:Subscribe",
          "sns:ConfirmSubscription",
          "sns:ListTopics"
        ]
        Resource = "arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:*"
      },
      {
        Sid    = "SQSFull"
        Effect = "Allow"
        Action = [
          "sqs:AddPermission",
          "sqs:ChangeMessageVisibility",
          "sqs:ChangeMessageVisibilityBatch",
          "sqs:CreateQueue",
          "sqs:DeleteMessage",
          "sqs:DeleteMessageBatch",
          "sqs:DeleteQueue",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl",
          "sqs:ListDeadLetterSourceQueues",
          "sqs:ListQueueTags",
          "sqs:ListQueues",
          "sqs:PurgeQueue",
          "sqs:ReceiveMessage",
          "sqs:RemovePermission",
          "sqs:SendMessage",
          "sqs:SendMessageBatch",
          "sqs:SetQueueAttributes",
          "sqs:TagQueue",
          "sqs:UntagQueue"
        ]
        Resource = "arn:aws:sqs:*:${data.aws_caller_identity.current.account_id}:${var.app_ci}*"
      },
      {
        Sid      = "DynamoDBPermissions"
        Effect   = "Allow"
        Action   = "dynamodb:*"
        Resource = "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/*"
      },
      {
        Sid    = "cclS3BucketListPermissions"
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:ListAllMyBuckets"
        ]
        Resource = "arn:aws:s3:::*"
      },
      {
        Sid    = "cclS3BucketPermissions"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::${var.app_ci}*/*"
      }
    ]
  })
}


# resource "aws_iam_policy" "Harness-shared-lambda-policy-kafka-dynamodb-s3" {
#   name = "Harness-shared-lambda-policy-kafka-dynamodb-s3-${var.app_ci}-${var.env}"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement =[
#       {
#         Sid    = "LambdaMSK"
#         Effect = "Allow"
#         Action = [
#           "kafka-cluster:Connect",
#           "kafka-cluster:DescribeGroup",
#           "kafka-cluster:AlterGroup",
#           "kafka-cluster:DescribeTopic",
#           "kafka-cluster:ReadData",
#           "kafka-cluster:DescribeClusterDynamicConfiguration"
#         ]
#         Resource = [
#           "arn:aws:kafka:*:${data.aws_caller_identity.current.account_id}:cluster/${var.msk_cluster}/*",
#           "arn:aws:kafka:*:${data.aws_caller_identity.current.account_id}:topic/${var.msk_cluster}/*",
#           "arn:aws:kafka:*:${data.aws_caller_identity.current.account_id}:group/${var.msk_cluster}/*"
#         ]
#       }
#       # {
#       #   Sid = "PermissionOnKafka"
#       #   Action = [
#       #     "kafka:DescribeCluster",
#       #     "kafka:GetBootstrapBrokers"
#       #   ]
#       #   Effect   = "Allow"
#       #   Resource = "arn:aws:kafka:*:${data.aws_caller_identity.current.account_id}:cluster/${var.msk_cluster}/*"
#       # },
#       # {
#       #   Sid    = "SecurityGroupPermissions"
#       #   Effect = "Allow",
#       #   Action = ["ec2:DescribeSecurityGroups"],
#       #   Resource = [
#       #     "arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id}:security-group/sg-0952538c1d27b4a6a",
#       #     "arn:aws:ec2:${var.region}:${data.aws_caller_identity.current.account_id}:security-group/sg-0da33fffb2e9c4d16"]
#       # }
      
#     ]
#   })
# }

resource "aws_iam_policy" "Harness-shared-lambda-policy-apigw" {
  name = "Harness-shared-lambda-policy-apigw-${var.app_ci}-${var.env}"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement =[
      {
        Sid    = "LambdaApigw"
        Effect = "Allow"
        Action = [
          "execute-api:ManageConnections",
        ]
        Resource = [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "Harness-shared-lambda-policy-execution" {
  name = "Harness-shared-lambda-policy-execution-${var.app_ci}-${var.env}"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement =[
      {
        Sid    = "LambdaExecution"
        Effect = "Allow"
        Action = [
          "lambda:InvokeFunction",
        ]
        Resource = [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_sns_sqs_dynamodb_s3" {
  #count      = var.iam_role_arn == null ? 1 : 0 # Attach policies only if creating a new role
  role       = aws_iam_role.Harness-ccl-shared_lambda_role.name
  policy_arn = aws_iam_policy.Harness-shared-lambda-policy-sns-sqs-dynamodb-s3.arn
}

# resource "aws_iam_role_policy_attachment" "lambda-policy-kafka-dynamodb-s3" {
#   role =  aws_iam_role.Harness-ccl-shared_lambda_role.name
#   policy_arn = aws_iam_policy.Harness-shared-lambda-policy-kafka-dynamodb-s3.arn
# }

resource "aws_iam_role_policy_attachment" "AWS_MSK_managed_lambda_execution_policy" {
  role       = aws_iam_role.Harness-ccl-shared_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaMSKExecutionRole"
}

resource "aws_iam_role_policy_attachment" "AWS_APIGW_lambda_execution_policy" {
  role       = aws_iam_role.Harness-ccl-shared_lambda_role.name
  policy_arn = aws_iam_policy.Harness-shared-lambda-policy-apigw.arn
}

resource "aws_iam_role_policy_attachment" "AWS_lambda_execution_policy" {
  role       = aws_iam_role.Harness-ccl-shared_lambda_role.name
  policy_arn = aws_iam_policy.Harness-shared-lambda-policy-execution.arn
}
