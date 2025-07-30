
variable "env" {
  description = "This variable is used for any environment"
  default     = ""
}


variable "account_id" {
  type    = string
  default = "730335642042" # Add your parallel Lambda function names here
}


variable "role_arn" {
  description = "The role arn that has access to resource"
  type        = string
  default     = null
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




