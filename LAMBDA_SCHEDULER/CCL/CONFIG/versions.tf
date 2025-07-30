terraform {
  required_version = ">= 1.0.0"
  # backend "s3" {
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
    harness = {
      source  = "harness/harness"
      version = "0.22.1"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}
