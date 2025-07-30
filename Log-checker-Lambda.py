
import boto3
import os

def lambda_handler(event, context):
    cloudwatch = boto3.client('logs')
    sns_client = boto3.client('sns')
    
    # Retrieve the SNS topic ARN from environment variables
    sns_topic_arn = os.environ.get('SNS_TOPIC_ARN')
    if not sns_topic_arn:
        raise ValueError("SNS_TOPIC_ARN environment variable is not set")
    
    # Retrieve the list of Lambda functions from the environment variable
    lambda_functions_env = os.environ.get('LAMBDA_FUNCTIONS')
    if not lambda_functions_env:
        raise ValueError("LAMBDA_FUNCTIONS environment variable is not set")
    
    # Convert the comma-separated list from the environment variable into a list
    lambda_functions = lambda_functions_env.split(',')
    
    error_string = "Error reading SSH protocol banner[Errno 104] Connection reset by peer"
    lambdas_with_errors = []  # List to hold Lambda function names with errors
    lambdas_without_errors = []  # List to hold Lambda function names without errors

    for function_name in lambda_functions:
        log_group_name = f"/aws/lambda/{function_name.strip()}"
        try:
            # Fetch most recent log streams for the Lambda function (limit to 1 most recent stream)
            log_streams = cloudwatch.describe_log_streams(
                logGroupName=log_group_name,
                orderBy='LastEventTime',  # Order by most recent logs
                descending=True,          # Get the most recent log stream
                limit=1                   # Limit to the most recent log stream
            )
            if log_streams['logStreams']:
                # Get log events from the most recent stream
                log_stream_name = log_streams['logStreams'][0]['logStreamName']
                log_events = cloudwatch.get_log_events(
                    logGroupName=log_group_name,
                    logStreamName=log_stream_name,
                    limit=100  # Fetch the last 100 log events from the most recent log stream
                )
                # Check for the error in the log events
                if any(error_string in event['message'] for event in log_events['events']):
                    lambdas_with_errors.append(function_name)
                else:
                    lambdas_without_errors.append(function_name)
            else:
                # No logs found for this Lambda
                print(f"No logs found for Lambda function: {function_name}")
                lambdas_without_errors.append(function_name)
        except Exception as e:
            # Handle errors in retrieving log information for the function
            print(f"Error checking logs for Lambda function {function_name}: {str(e)}")

    # Prepare the message to send
    message = (
        f"Lambda functions with errors: {lambdas_with_errors}\n"
        f"Lambda functions without errors: {lambdas_without_errors}"
    )
    print(message)  # Log the message

    # Publish the results to the SNS topic
    try:
        sns_client.publish(
            TopicArn=sns_topic_arn,
            Subject="Lambda Log Check Results",
            Message=message
        )
        print("Results sent to SNS topic successfully")
    except Exception as sns_error:
        print(f"Error sending message to SNS topic: {str(sns_error)}")
    
    # Return both lists
    return {
        "lambdas_with_errors": lambdas_with_errors,
        "lambdas_without_errors": lambdas_without_errors
    }
