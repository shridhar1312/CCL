assume_role_arn       = "arn:aws:iam::788168375535:role/HarnessCDDelegateRole"
iam_role_arn          = "arn:aws:iam::788168375535:role/Harness-ccl-shared-lambda-role-stg"
role_arn              = "arn:aws:iam::788168375535:role/HarnessCDDelegateRole"
account_id            = "788168375535"
region                = "us-east-2"
app_ci                = "ccl"
env                   = "stg"
subscribe_to_firehose = true

#change this
app_subnet_a       = "subnet-05e9367d94b3119f2"
app_subnet_b       = "subnet-0f81c71725a20a21e"
security_group_ids = ["sg-08875c5cdb205ac76"]

global_environment_variables = {
  "S3_BUCKET"                        = "ccl-s3-stg"
  "DYNAMODB_CALCULATIONS_TABLE"      = "ccl-Calculations"
  "DYNAMODB_WBACTIVESTNS_TABLE"      = "ccl-WBActiveStns"
  "DYNAMODB_WBLOCKTABLE_TABLE"       = "ccl-WBLockTable"
  "DYNAMODB_WBSTATIONARYDATA_TABLE"  = "ccl-WBStationaryData"
  "DYNAMODB_WBSTATIONARYDATA1_TABLE" = "ccl-WBStationaryData1"
  "DYNAMODB_WBTRANSDATA_TABLE"       = "ccl-WBTransData"
  "APPLICATION_CI"                   = "ccl"
  "ENV"                              = "stg"
  "ENVIRONMENT"                      = "stg"
  "REGION"                           = "us-east-2"
}

lambda_functions = {
  "LOADINSTRUCTIONSdataloadingLambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/LOADINSTRUCTIONS.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "AircraftdetailsLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/AIRCRAFTDETAILS.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "ServerConfigDataLoadingdynamodblambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/SERVERCONFIG.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "ClientConfigDataLoadingdynamodblambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/CLIENTCONFIG.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "RoleInfoLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/ROLEINFO.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "RolebasedflightruleLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/ROLEBASEDFLIGHTRULE.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "AutoreasonLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/AUTOREASON.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  "ContainerLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/CONTAINER.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"],
  },
  UserroledescLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/USERROLEDESC.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  EquipmentmapLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/EQUIPMENTMAP.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  AircraftdetailsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/AIRCRAFTDETAILS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  DOORDataLoadingdynamodblambda = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/DOOR.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  PitsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/PITS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  RearcellLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/REARCELL.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  StoplocksLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/STOPLOCKS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  AcftconfigLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/ACFTCONFIG.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  EquipmentLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/EQUIPMENT.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  ForecastregionsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/FORECASTREGIONS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  ForecastvalueLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/FORECASTVALUE.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  GroupintervalsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/GROUPINTERVALS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  BprforecastLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/BPRFORECAST.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  PitboxLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/PITBOX.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  FilconfigLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/FILCONFIG.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  PaxssrcodesLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/PAXSSRCODES.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  RegionofficerLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/REGIONOFFICER.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  StationpairLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/STATIONPAIR.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  WtrLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-stg"
    s3_key         = "Lambda_deployment/Lambda_deployments/WTR.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1",
      "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"
    ]
  },
  "PHFdataloadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PHF.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "REVDataloadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/REV.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TTR1DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR1.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TTR2DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TTR3DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR3.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TTR4DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR4.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TTR5DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR5.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "HofConLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HOFCON.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "BprforecastLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPRFORECAST.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "PitboxLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PITBOX.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "FilconfigLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FILCONFIG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "SlsLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SLS.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "BPR1DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR1.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  /*"BPR2DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "BPR3DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR3.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "BPR4DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR4.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "BPR5DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR5.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },*/
  "PRF1DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF1.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "PRF2DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "PRF3DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF3.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "PRF4DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF4.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "AcfatqLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACFATQ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "AcfmtrLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACFMTR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "CctLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CCT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "CtfLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CTF.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "AttypeLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATTYPE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "DSRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "PIZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PIZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "STALambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STA.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "MPRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/MPR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "SCZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SCZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "CFGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CFG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "FUZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FUZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "COGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/COG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "FBZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FBZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TRMLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TRM.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "ATQLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATQ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "SLMLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SLM.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "ADDLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ADD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "AFLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AFL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TSLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TSL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "LC2Lambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/LC2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "DSKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "FTGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FTG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "CFTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CFT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "HITLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HIT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "HRLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HRL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "MSGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/MSG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "NTELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/NTE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "AADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AAD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "DIPLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DIP.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "SMTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SMT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "FTRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FTR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "FLAGBXLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FLAGBX.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "ACCMINLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACCMIN.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "INTDTELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/INTDTE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "HSKPNGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HSKPNG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "GMDATELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/GMDATE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "GMTIMELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/GMTIME.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "StatusLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STATUS.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "STAT02Lambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STAT02.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "CMCLCKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CMCLCK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKHSKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKHSK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "DSPLCKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSPLCK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKICKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKICK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKPARLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKPAR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKINTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKINT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKDPFLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKDPF.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "ATEQPXLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATEQPX.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "SYDFILLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SYDFIL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKPADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKPAD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "STAFUELLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STAFUEL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "AADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AAD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  /*"DeleteBPRFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPRDELETE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },*/
  "DeletePRFFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRFDELETE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "DeleteTTRFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTRDELETE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "CELLDataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CELL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "TeamlpscheduleLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "ephemeral_size" = 512,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TEAMLPSCHEDULE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "WBKDPALambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-stg",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKDPA.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:788168375535:layer:ccl-stg-request-layer:1", "arn:aws:lambda:us-east-2:788168375535:layer:ccl-paramiko-lambda-layer-stg:1"]
  },
  "RealTimeDataLoadingdynamodblambda" = {
    "memory_size"                = 10240,
    "ephemeral_size"             = 10240,
    "timeout"                    = 900,
    "s3_bucket"                  = "ccl-lambdas-artifacts-stg",
    "s3_key"                     = "Lambda_deployment/Lambda_deployments/REALTIMEDATALOADING.zip",
    "lambda_runtime"             = "python3.11",
    "layers"                     = []
    "lambda_event_mapping"       = true,
    "msk_arn"                    = "arn:aws:kafka:us-east-2:788168375535:cluster/bbt-msk-cluster/ae1a23e4-da77-45c2-becf-19e106e0e32b-4",
    "msk_topic"                  = ["OPS.NOC.WB.REFDATA.OUT"],
    "consumer_batch_size"        = 10,
    "app_subnet_c"               = "subnet-0bfb0afdcee588c2a",
    "consumer_starting_position" = "LATEST",
    environment_variables = {
      "DYNAMODB_WBSTATIONARYDATA_TABLE"  = "ccl-WBStationaryData"
    }
  }
}
