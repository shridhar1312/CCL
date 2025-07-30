# Variables for Lambda functions
variable "lambda_functions" {
  type    = list(string)
  default = ["bpr1", "bpr2"] # Add more Lambda function names here if needed
}

variable "schedule_expression" {
  description = "Schedule expression for the CloudWatch event rule"
  type        = string
}

variable "lambda_functions_parallel" {
  type    = list(string)
  default = ["bpr3", "bpr4"]

}



variable "account_id" {
  type    = string
  default = "730335642042" # Add your parallel Lambda function names here
}


variable "role_arn" {
  description = "The role arn that has access to resource"
  type        = string
}
# variable "assume_role_arn" {
#   type        = string
#   description = "The role arn that has access to resource"
# }

variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-2"
}


variable "app_ci" {
  description = "Lowercase AppCI"
  default     = "ccl"
}

variable "env" {
  description = "env"
  default     = "dev"
}
