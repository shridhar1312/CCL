variable "lambda_functions" {
  type = map(object({
    memory_size    = number
    timeout        = number
    ephemeral_size = optional(number)
    s3_bucket      = string
    s3_key         = string
    lambda_runtime = string

    iam_role_arn               = optional(string) # Optional IAM Role ARN
    layers                     = list(string)
    lambda_event_mapping       = optional(bool, false)
    consumer_batch_size        = optional(number, 10)
    msk_topic                  = optional(list(string), [])
    msk_arn                    = optional(string, null)
    consumer_starting_position = optional(string, null)
    app_subnet_c               = optional(string, null)
    enable_vpc                 = optional(bool, true)
  }))

}

variable "iam_role_arn" {
  description = "The role arn for lambda role"
  type        = string
  default     = "arn:aws:iam::333458576590:role/Harness-ccl-AADLambdadataloading-dev"

}
variable "account_id" {
  description = "This variable is used for the account ID"
}
variable "role_arn" {
  description = "The role arn that has access to resource"
  type        = string
}
variable "assume_role_arn" {
  type        = string
  description = "The role arn that has access to resource"
}

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

variable "layers" {
  description = "List of Lambda Layer ARNs"
  type        = list(string)
  default     = []
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
  description = "Subnet C"
  default     = null  
}

variable "security_group_ids" {
  description = "Secutity group "
  type        = list(string)
  default     = ["sg-055cf5aed359630b6"]
}

variable "subscribe_to_firehose" {
  description = "Subscribe to Firehose"
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