role_arn       = "arn:aws:iam::788168375535:role/HarnessCDDelegateRole"
bucket         = "ccl-statefile-us-east-2-stage-788168375535"
key            = "CCL_lambda_Scheduler/terraform.tfstate"
region         = "us-east-2"
dynamodb_table = "ccl-dynamodb-us-east-2-stage-788168375535"
encrypt        = true
#workspace ccl-lambdas-stage
