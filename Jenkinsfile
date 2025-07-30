pipeline {
  agent any
  parameters {
    choice(name: 'ENV', choices: ['DEV','QA','PROD'], description: 'Select environment')
  }
  environment {
    TF_VAR_FILE = "ENVS/${params.ENV}/${params.ENV.toLowerCase()}.tfvars"
    AWS_DEFAULT_REGION = 'us-east-1'
  }
  tools { terraform 'terraform-1.5.7' }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Terraform fmt & lint') {
      steps {
        sh 'terraform fmt -check -recursive'
        sh 'tflint || echo "⚠️ tflint found issues."'
      }
    }
    stage('Init & Plan') {
      steps {
        withAWS(credentials: 'aws-credentials', region: "${env.AWS_DEFAULT_REGION}") {
          sh 'terraform init -backend-config=backend.tfvars'
          sh "terraform plan -var-file=${env.TF_VAR_FILE} -out=tfplan"
        }
      }
    }
    stage('Apply Changes') {
      when { branch 'main' }
      steps {
        input message: "Approve apply to ${params.ENV}?"
        withAWS(credentials: 'aws-credentials', region: "${env.AWS_DEFAULT_REGION}") {
          sh 'terraform apply -auto-approve tfplan'
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
