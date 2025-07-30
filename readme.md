## 📊 Execution Flow Summary

```mermaid
graph TD
    A[Step Function Execution] --> B{Each Lambda executed sequentially}
    B --> C[On Completion (Success/Failure)]
    C --> D[CloudWatch Event Triggered]
    D --> E[log_checker_lambda Invoked]
    E --> F{CloudWatch Logs of All Lambdas Checked}
    F --> G[SNS Message Published to Topic]
    G --> H[Email Sent to You]


Lambdas That Send the Notifications
🔹 log_checker_lambda
Purpose:
Check CloudWatch Logs of all the Lambdas in LAMBDA_FUNCTIONS

Detect a specific error string

Categorize functions into:

With errors

Without errors

Send an SNS message with both lists

🔹 notify_on_failure Lambda
This Lambda is not actually invoked by Step Functions directly, because:

It's not used in your CloudWatch Event Target (log_checker_lambda is used)

However, it's deployed and available, so maybe you plan to use it later?

Its logic:

Parses the Step Function execution history

Filters out failed Lambda tasks

Sends a detailed error report via SNS

You could make it part of the notification pipeline if you prefer analyzing Step Function history over raw CloudWatch logs.

# CCL
