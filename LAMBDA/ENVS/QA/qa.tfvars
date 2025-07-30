assume_role_arn       = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"
iam_role_arn          = "arn:aws:iam::312793993380:role/Harness-ccl-shared-lambda-role-qa"
role_arn              = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"
account_id            = "312793993380"
region                = "us-east-2"
app_ci                = "ccl"
env                   = "qa"
subscribe_to_firehose = true

#change this
app_subnet_a       = "subnet-0f7dfda96170bfa41"
app_subnet_b       = "subnet-0b4de00711efa727e"
security_group_ids = ["sg-055cf5aed359630b6"]

global_environment_variables = {
  env = "qa"
  ng_dynamodb_table_name= "ccl-WSEvents"
  TRANSDATA_TABLE = "ccl-WBTransData"
  STATIONARY_TABLE = "ccl-WBStationaryData"
  API_GW_ENDPOINT ="https://fzqi8nql9k.execute-api.us-east-2.amazonaws.com/qa"
}

lambda_functions = {
  "LOADINSTRUCTIONSdataloadingLambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/LOADINSTRUCTIONS.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "AircraftdetailsLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/AIRCRAFTDETAILS.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "ServerConfigDataLoadingdynamodblambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/SERVERCONFIG.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "ClientConfigDataLoadingdynamodblambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/CLIENTCONFIG.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "RoleInfoLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/ROLEINFO.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "RolebasedflightruleLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/ROLEBASEDFLIGHTRULE.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "AutoreasonLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/AUTOREASON.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  "ContainerLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/CONTAINER.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::312793993380:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"],
  },
  UserroledescLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/USERROLEDESC.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  EquipmentmapLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/EQUIPMENTMAP.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  AircraftdetailsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/AIRCRAFTDETAILS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  DOORDataLoadingdynamodblambda = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/DOOR.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  PitsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/PITS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  RearcellLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/REARCELL.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  StoplocksLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/STOPLOCKS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  AcftconfigLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/ACFTCONFIG.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  EquipmentLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/EQUIPMENT.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  ForecastregionsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/FORECASTREGIONS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  ForecastvalueLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/FORECASTVALUE.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  GroupintervalsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/GROUPINTERVALS.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  BprforecastLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/BPRFORECAST.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  PitboxLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/PITBOX.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  FilconfigLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/FILCONFIG.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  PaxssrcodesLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/PAXSSRCODES.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  RegionofficerLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/REGIONOFFICER.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  StationpairLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/STATIONPAIR.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  WtrLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-qa"
    s3_key         = "Lambda_deployment/Lambda_deployments/WTR.zip"
    lambda_runtime = "python3.11"
    layers = [
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1",
      "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"
    ]
  },
  "PHFdataloadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PHF.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "REVDataloadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/REV.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TTR1DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR1.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TTR2DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TTR3DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR3.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TTR4DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR4.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TTR5DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR5.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "HofConLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HOFCON.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "BprforecastLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPRFORECAST.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "PitboxLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PITBOX.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "FilconfigLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FILCONFIG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "SlsLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SLS.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "BPR1DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR1.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  /*"BPR2DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "BPR3DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR3.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "BPR4DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR4.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "BPR5DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR5.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },*/
  "PRF1DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF1.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "PRF2DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "PRF3DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF3.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "PRF4DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF4.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "AcfatqLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACFATQ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "AcfmtrLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACFMTR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "CctLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CCT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "CtfLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CTF.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "AttypeLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATTYPE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "DSRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "PIZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PIZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "STALambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STA.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "MPRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/MPR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "SCZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SCZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "CFGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CFG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "FUZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FUZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "COGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/COG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "FBZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FBZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TRMLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TRM.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "ATQLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATQ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "SLMLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SLM.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "ADDLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ADD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "AFLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AFL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TSLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TSL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "LC2Lambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/LC2.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "DSKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "FTGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FTG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBZ.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "CFTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CFT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "HITLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HIT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "HRLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HRL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "MSGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/MSG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "NTELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/NTE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "AADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AAD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "DIPLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DIP.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "SMTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SMT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "FTRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FTR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "FLAGBXLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FLAGBX.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "ACCMINLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACCMIN.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "INTDTELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/INTDTE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "HSKPNGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HSKPNG.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "GMDATELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/GMDATE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "GMTIMELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/GMTIME.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "StatusLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STATUS.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "STAT02Lambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STAT02.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "CMCLCKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CMCLCK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKHSKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKHSK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "DSPLCKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSPLCK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKICKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKICK.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKPARLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKPAR.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKINTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKINT.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKDPFLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKDPF.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "ATEQPXLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATEQPX.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "SYDFILLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SYDFIL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKPADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKPAD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "STAFUELLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STAFUEL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "AADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AAD.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  /*"DeleteBPRFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPRDELETE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },*/
  "DeletePRFFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRFDELETE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "DeleteTTRFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTRDELETE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "CELLDataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CELL.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "TeamlpscheduleLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "ephemeral_size" = 512,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TEAMLPSCHEDULE.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "WBKDPALambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-qa",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKDPA.zip",
    "lambda_runtime" = "python3.11",
    "layers"         = ["arn:aws:lambda:us-east-2:312793993380:layer:ccl-request-layer:1", "arn:aws:lambda:us-east-2:312793993380:layer:ccl-paramiko-lambda-layer-qa:3"]
  },
  "RealTimeDataLoadingdynamodblambda" = {
    "memory_size"                = 10240,
    "ephemeral_size"             = 10240,
    "timeout"                    = 900,
    "s3_bucket"                  = "ccl-lambdas-artifacts-qa",
    "s3_key"                     = "Lambda_deployment/Lambda_deployments/REALTIMEDATALOADING.zip",
    "lambda_runtime"             = "python3.11",
    "layers"                     = []
    "lambda_event_mapping"       = true,
    "msk_arn"                    = "arn:aws:kafka:us-east-2:312793993380:cluster/bbt-msk-cluster/398b03f5-e641-45ae-83ab-8f0f5f1328c9-7",
    "msk_topic"                  = ["OPS.NOC.WB.REFDATA.OUT"],
    "consumer_batch_size"        = 10,
    "app_subnet_c"               = "subnet-01676d821f666a1d9",
    "consumer_starting_position" = "LATEST"
  },
  "WSConnect" = {
    "memory_size"                = 10240,
    "ephemeral_size"             = 10240,
    "timeout"                    = 900,
    "s3_bucket"                  = "ccl-lambdas-artifacts-qa",
    "s3_key"                     = "Lambda_deployment/Lambda_deployments/WSConnect.zip",
    "lambda_runtime"             = "python3.13",
    "layers"                     = [],
    "enable_vpc"                 = false
  },

  "WSDisconnect" = {
    "memory_size"                = 10240,
    "ephemeral_size"             = 10240,
    "timeout"                    = 900,
    "s3_bucket"                  = "ccl-lambdas-artifacts-qa",
    "s3_key"                     = "Lambda_deployment/Lambda_deployments/WSDisconnect.zip",
    "lambda_runtime"             = "python3.13",
    "layers"                     = [],
    "enable_vpc"                 = false
  },

  "SendWSEvents" = {
    "memory_size"                = 10240,
    "ephemeral_size"             = 10240,
    "timeout"                    = 900,
    "s3_bucket"                  = "ccl-lambdas-artifacts-qa",
    "s3_key"                     = "Lambda_deployment/Lambda_deployments/SendWSEvents.zip",
    "lambda_runtime"             = "python3.13",
    "layers"                     = [],
    "enable_vpc"                 = false
  },

  "PublishWSEvents" = {
    "memory_size"                = 10240,
    "ephemeral_size"             = 10240,
    "timeout"                    = 900,
    "s3_bucket"                  = "ccl-lambdas-artifacts-qa",
    "s3_key"                     = "Lambda_deployment/Lambda_deployments/PublishWSEvents.zip",
    "lambda_runtime"             = "python3.13",
    "layers"                     = []
    "lambda_event_mapping"       = true,
    "msk_arn"                    = "arn:aws:kafka:us-east-2:312793993380:cluster/ccl-msk-cluster/88d80597-0b24-4999-aa08-fb3327639ba4-7",
    "msk_topic"                  = ["UAL.OPS.NOC.WB.COLLAB.FLIGHTDISTRIBUTION.OUT"],
    "consumer_batch_size"        = 10,
    "app_subnet_c"               = "subnet-01676d821f666a1d9",
    "consumer_starting_position" = "LATEST"
  }

}
