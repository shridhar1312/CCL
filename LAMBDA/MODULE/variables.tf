variable "env" {
  description = "Environment name for creating resources"
  default     = "qa"
}

variable "function_name" {
  description = "middle name for lambda function creating resources"
  default     = "PHFDataLoading"
}

variable "role_arn" {
  description = "The role arn that has access to resource"
  type        = string
}


variable "account_id" {
  description = "This variable is used for the account ID"
}

variable "assume_role_arn" {
  type        = string
  description = "The role arn that has access to resource"
}

variable "iam_role_arn" {
  type        = string
  description = "The role arn for lambda function"
  default     = "arn:aws:iam::333458576590:role/Harness-ccl-AADLambdadataloading-dev"

}

variable "app_ci" {
  description = "Lowercase AppCI"
  default     = "ccl"
}

variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-2"
}

variable "upper_case_app_ci" {
  description = "Uppercase AppCI"
  default     = "CCL"
}

variable "sla_level" {
  description = "SLA Level"
  default     = "Tier 1"
}

variable "risk_data_class" {
  description = "Risk Data Classification"
  default     = "No Risk"
}

variable "application_contact_dl" {
  description = "Application Contact Distribution List"
  default     = "ATW_DevOps@united.com"
}

variable "maintenance_window" {
  description = "Maintenance Window"
  default     = "never"
}

variable "internal_external" {
  description = "Internal or External"
  default     = "internal"
}

variable "data_retention_period" {
  description = "Data Retention Period"
  default     = "2 years"
}

variable "regulatory_controls" {
  description = "Regulatory Controls"
  default     = "None"
}

variable "lambda_runtime" {
  description = "Lambda runtime to use"
  default     = "python3.8"
  validation {
    condition     = contains(["python3.8", "python3.9", "python3.11", "python3.13"], var.lambda_runtime)
    error_message = "Invalid Lambda runtime"
  }
}

variable "lambda_memory_size" {
  description = "Lambda Memory Size"
  default     = "256"
}

variable "lambda_timeout" {
  description = "Lambda Timeout"
  default     = "900"
}

variable "ephemeral_size" {
  description = "Ephemeral storage size for Lambda function (in MB)"
  type        = number
  default     = "512" # default size (in MB)
}

variable "ccl_table_name" {
  description = "DynamoDB table name"
  default     = "ccl-PHF-dataloading"
}

variable "app_subnet_a" {
  description = "Subnet A"
  default     = "subnet-0f7dfda96170bfa41"
}

variable "app_subnet_b" {
  description = "Subnet B"
  default     = "subnet-0b4de00711efa727e"
}

variable "app_subnet_c" {
  description = "subnet c"
  default = null #optional
}

variable "security_group_ids" {
  description = "Secutity group "
  type        = list(string)
  default     = ["sg-055cf5aed359630b6"]
}

variable "s3_bucket_name" {
  description = "S3 bucket name containing the Python script"
  #default     = "ccl-s3-qa"
}

variable "s3_script_key" {
  description = "S3 key for the Python script"
  default     = "CCL-Lambda-Functions/phfDataLoading.zip"
}

variable "layers" {
  description = "List of Lambda Layer ARNs"
  type        = list(string)
  default     = []
}

variable "subscribe_to_firehose" {
  description = "Subscribe to Firehose"
  type        = bool
  default     = false
}

variable "consumer_batch_size" {
  description = "value for consumer batch size"
  type        = number
  default     = null
}

variable "msk_arn" {
  description = "ARN value for MSK ARN"
  default     = null
}

variable "msk_topic" {
  description = "MSK topic name"
  type        = list(string)
  default     = []
}

variable "consumer_starting_position" {
  description = "value for consumer starting position"
  default     = null
}

variable "consumer_group_id" {
  description = "value for consumer group id"
  default     = "null"
}

variable "lambda_event_mapping" {
  description = "value for lambda event mapping"
  type        = bool
  default     = false
}


variable "environment_variables"{
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}


variable "global_environment_variables"{
  description = "Default Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "enable_vpc" {
  description = "Whether to enable VPC configuration for the Lambda function"
  type        = bool
  default     = true
}