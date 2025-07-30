role_arn = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"
#role_arn        = "arn:aws:iam::333458576590:role/HarnessCDDelegateRole"

bucket         = "ccl-statefile-us-east-2-qa-312793993380"
key            = "CCL_lambdas/terraform.tfstate"
region         = "us-east-2"
dynamodb_table = "ccl-dynamodb-us-east-2-qa-312793993380"
encrypt        = true

