pipeline {
    agent any
    parameters {
        choice(name: 'ENV', choices: ['DEV', 'QA', 'STAGE', 'PROD'], description: 'Select environment')
    }
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_VAR_FILE = "ENVS/${params.ENV.toUpperCase()}/${params.ENV.toLowerCase()}.tfvars"
        BACKEND_CONFIG = "ENVS/${params.ENV.toUpperCase()}/${params.ENV.toLowerCase()}_backend.tfvars"
    }
    tools {
        terraform 'terraform-1.12.2'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh """
                    terraform init \
                        -backend-config=${env.BACKEND_CONFIG}
                    """
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh """
                    terraform plan \
                        -var-file=${env.TF_VAR_FILE} \
                        -out=tfplan
                    """
                }
            }
        }
        stage('Terraform Apply') {
            when {
                branch 'main'
            }
            steps {
                input message: "Approve apply to ${params.ENV}?"
                script {
                    sh """
                    terraform apply \
                        -auto-approve \
                        tfplan
                    """
                }
            }
        }
    }
    post {
        success {
            echo "✅ Terraform applied successfully for ${params.ENV}"
        }
        failure {
            echo "❌ Terraform pipeline failed for ${params.ENV}"
            mail to: 'devops-team@example.com',
                 subject: "Terraform pipeline failed: ${env.JOB_NAME}",
                 body: env.BUILD_URL
        }
    }
}
