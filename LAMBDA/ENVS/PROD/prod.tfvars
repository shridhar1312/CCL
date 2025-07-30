assume_role_arn       = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"
iam_role_arn          = "arn:aws:iam::648093644542:role/Harness-ccl-shared-lambda-role-prod"
role_arn              = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"
account_id            = "648093644542"
region                = "us-east-2"
app_ci                = "ccl"
env                   = "prd"
subscribe_to_firehose = true

#change this
app_subnet_a       = "subnet-0e77702cf78b54be3"
app_subnet_b       = "subnet-0bee2fe99363ea637"
security_group_ids = "sg-0b00218b4a4ab3a11"

lambda_functions = {
  "LOADINSTRUCTIONSdataloadingLambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/LOADINSTRUCTIONS.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AircraftdetailsLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/AIRCRAFTDETAILS.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ServerConfigDataLoadingdynamodblambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/SERVERCONFIG.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ClientConfigDataLoadingdynamodblambda" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/CLIENTCONFIG.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "RoleInfoLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/ROLEINFO.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "RolebasedflightruleLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/ROLEBASEDFLIGHTRULE.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AutoreasonLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/AUTOREASON.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ContainerLambdadataloading" = {
    memory_size    = 10240,
    ephemeral_size = 10240,
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/CONTAINER.zip"
    lambda_runtime = "python3.11"
    #iam_role_arn   = "arn:aws:iam::648093644542:role/HarnessCDDelegateRole"  # Optional
    layers = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  UserroledescLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/USERROLEDESC.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  EquipmentmapLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/EQUIPMENTMAP.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  AircraftdetailsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/AIRCRAFTDETAILS.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  DOORDataLoadingdynamodblambda = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/DOOR.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  PitsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/PITS.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  RearcellLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/REARCELL.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  StoplocksLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/STOPLOCKS.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  AcftconfigLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/ACFTCONFIG.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  EquipmentLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/EQUIPMENT.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  ForecastregionsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/FORECASTREGIONS.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  ForecastvalueLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/FORECASTVALUE.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  GroupintervalsLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/GROUPINTERVALS.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  BprforecastLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/BPRFORECAST.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  PitboxLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/PITBOX.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  FilconfigLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/FILCONFIG.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  PaxssrcodesLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/PAXSSRCODES.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  RegionofficerLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/REGIONOFFICER.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  StationpairLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/STATIONPAIR.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  WtrLambdadataloading = {
    memory_size    = 10240
    ephemeral_size = 10240
    timeout        = 900
    s3_bucket      = "ccl-lambdas-artifacts-prod"
    s3_key         = "Lambda_deployment/Lambda_deployments/WTR.zip"
    lambda_runtime = "python3.11"
    layers         = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PHFdataloadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PHF.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "REVDataloadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/REV.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TTR1DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR1.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TTR2DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR2.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TTR3DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR3.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TTR4DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR4.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TTR5DataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTR5.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "HofConLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HOFCON.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "BprforecastLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPRFORECAST.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PitboxLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PITBOX.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "FilconfigLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FILCONFIG.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "SlsLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SLS.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "BPR1DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR1.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "BPR2DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR2.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "BPR3DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR3.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "BPR4DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR4.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "BPR5DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPR5.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PRF1DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF1.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PRF2DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF2.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PRF3DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF3.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PRF4DataLoadingLambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRF4.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AcfatqLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACFATQ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AcfmtrLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACFMTR.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "CctLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CCT.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "CtfLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CTF.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AttypeLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATTYPE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DSRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSR.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "PIZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PIZ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "STALambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STA.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "MPRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/MPR.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "SCZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SCZ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "CFGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CFG.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "FUZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FUZ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "COGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/COG.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "FBZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FBZ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TRMLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TRM.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ATQLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATQ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "SLMLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SLM.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ADDLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ADD.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AFLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AFL.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TSLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TSL.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "LC2Lambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/LC2.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DSKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSK.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "FTGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FTG.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBZLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBZ.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "CFTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CFT.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "HITLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HIT.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "HRLLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HRL.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "MSGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/MSG.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "NTELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/NTE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AAD.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DIPLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DIP.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "SMTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SMT.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "FTRLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FTR.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "FLAGBXLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/FLAGBX.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ACCMINLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ACCMIN.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "INTDTELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/INTDTE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "HSKPNGLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/HSKPNG.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "GMDATELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/GMDATE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "GMTIMELambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/GMTIME.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "StatusLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STATUS.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "STAT02Lambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STAT02.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "CMCLCKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CMCLCK.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKHSKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKHSK.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DSPLCKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/DSPLCK.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKICKLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKICK.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKPARLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKPAR.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKINTLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKINT.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKDPFLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKDPF.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "ATEQPXLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/ATEQPX.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "SYDFILLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/SYDFIL.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKPADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKPAD.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "STAFUELLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/STAFUEL.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "AADLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/AAD.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DeleteBPRFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/BPRDELETE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DeletePRFFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/PRFDELETE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "DeleteTTRFunction" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TTRDELETE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "CELLDataLoadingdynamodblambda" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/CELL.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "TeamlpscheduleLambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "ephemeral_size" = 512,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/TEAMLPSCHEDULE.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  },
  "WBKDPALambdadataloading" = {
    "memory_size"    = 10240,
    "ephemeral_size" = 10240,
    "timeout"        = 900,
    "s3_bucket"      = "ccl-lambdas-artifacts-prod",
    "s3_key"         = "Lambda_deployment/Lambda_deployments/WBKDPA.zip",
    "lambda_runtime" = "python3.11",
    layers           = ["arn:aws:lambda:us-east-2:648093644542:layer:ccl-request-lambda-layer-prod:1", "arn:aws:lambda:us-east-2:648093644542:layer:ccl-paramiko-lambda-layer-prod:2"],
  }
}
