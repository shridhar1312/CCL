  lambda_functions = [
  "ccl-AircraftdetailsLambdadataloading-dev", "ccl-LOADINSTRUCTIONSdataloadingLambda-dev","ccl-ServerConfigDataLoadingdynamodblambda-dev"
  ]

schedule_expression = "cron(0 15,17,19,21,23,1 * * ? *)"
#schedule_expression = "cron(0/5 * * * ? *)"

role_arn   = "arn:aws:iam::975050012121:role/Harness-ccl-shared-lambda-role-dev"
account_id = "975050012121"
region     = "us-east-1"
app_ci     = "ccl"
env        = "dev"
