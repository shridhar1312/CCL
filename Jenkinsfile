// pipeline {
//     agent any
//     parameters {
//         choice(name: 'ENV', choices: ['DEV', 'QA', 'STAGE', 'PROD'], description: 'Select environment')
//     }
//     environment {
//         AWS_DEFAULT_REGION = 'us-east-1'
//         TF_VAR_FILE = "ENVS/${params.ENV.toUpperCase()}/${params.ENV.toLowerCase()}.tfvars"
//         BACKEND_CONFIG = "ENVS/${params.ENV.toUpperCase()}/${params.ENV.toLowerCase()}_backend.tfvars"
//     }
//     tools {
//         terraform 'terraform-1.12.2'
//     }
//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }
//         stage('Terraform Init') {
//             steps {
//                 script {
//                     sh """
//                     terraform init \
//                         -backend-config=${env.BACKEND_CONFIG}
//                     """
//                 }
//             }
//         }
//         stage('Terraform Plan') {
//             steps {
//                 script {
//                     sh """
//                     terraform plan \
//                         -var-file=${env.TF_VAR_FILE} \
//                         -out=tfplan
//                     """
//                 }
//             }
//         }
//         stage('Terraform Apply') {
//             when {
//                 branch 'main'
//             }
//             steps {
//                 input message: "Approve apply to ${params.ENV}?"
//                 script {
//                     sh """
//                     terraform apply \
//                         -auto-approve \
//                         tfplan
//                     """
//                 }
//             }
//         }
//     }
//     post {
//         success {
//             echo "✅ Terraform applied successfully for ${params.ENV}"
//         }
//         failure {
//             echo "❌ Terraform pipeline failed for ${params.ENV}"
//             mail to: 'devops-team@example.com',
//                  subject: "Terraform pipeline failed: ${env.JOB_NAME}",
//                  body: env.BUILD_URL
//         }
//     }
// }

// pipeline {
//   agent any

//   parameters {
//     choice(name: 'ENV', choices: ['DEV', 'QA', 'PROD'], description: 'Select the environment to deploy')
//     string(name: 'TERRAFORM_DIR', defaultValue: '.', description: 'Path to the Terraform code directory (e.g., ".", "IAM_ROLES", "LAMBDA")')
//   }

// environment {
//   TF_VAR_FILE = "../ENVS/${params.ENV}/${params.ENV.toLowerCase()}.tfvars"
//   BACKEND_FILE = "../ENVS/${params.ENV}/${params.ENV.toLowerCase()}_backend.tfvars"
//   AWS_DEFAULT_REGION = 'us-east-1'
// }

//     tools {
//         terraform 'terraform-1.12.2'
//     }

//   stages {
//     stage('Terraform Init') {
//       steps {
//         dir("${params.TERRAFORM_DIR}") {
//           sh 'terraform init -backend-config=${BACKEND_FILE}'
//         }
//       }
//     }

//     stage('Terraform Plan') {
//       steps {
//         dir("${params.TERRAFORM_DIR}") {
//           sh 'terraform plan -var-file=${TF_VAR_FILE} -out=tfplan'
//         }
//       }
//     }

//     stage('Terraform Apply') {
//       when {
//         branch 'main'
//       }
//       steps {
//         input message: "Apply changes to ${params.ENV} in ${params.TERRAFORM_DIR}?"
//         dir("${params.TERRAFORM_DIR}") {
//           sh 'terraform apply -auto-approve tfplan'
//         }
//       }
//     }
//   }

//   post {
//     success {
//       echo "✅ Terraform applied successfully for ${params.ENV} in ${params.TERRAFORM_DIR}"
//     }
//     failure {
//       echo "❌ Terraform pipeline failed for ${params.ENV} in ${params.TERRAFORM_DIR}"
//     }
//   }
// }

pipeline {
  agent any

  parameters {
    choice(name: 'ENV', choices: ['DEV','QA','PROD'], description: 'Select environment')
    string(name: 'TERRAFORM_DIR', defaultValue: '.', description: 'Path to the Terraform code directory (e.g., ".", "IAM_ROLES", "LAMBDA")')
  }

  environment {
    AWS_DEFAULT_REGION = 'us-east-1'
    VAR_FILE = "../ENVS/${params.ENV}/${params.ENV.toLowerCase()}.tfvars"
    BACKEND_FILE = "../ENVS/${params.ENV}/${params.ENV.toLowerCase()}_backend.tfvars"
  }

  tools {
    terraform 'terraform-1.12.2'  // or whatever version you configured
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

       stage('Prepare AWS Credentials') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'dev']]) {
          // AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are injected automatically here
          echo "Using AWS credentials from Jenkins ID 'dev'"
        }
      }
    }

    stage('Terraform Init & Plan') {
      steps {
        dir("${params.TERRAFORM_DIR}/CONFIG") {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'dev']]) {
            sh "terraform init -backend-config=${env.BACKEND_FILE}"
            sh "terraform plan -var-file=${env.VAR_FILE} -out=tfplan"
          }
        }
      }
    }

    stage('Terraform Apply') {
      when { branch 'main' }
      steps {
        input message: "Apply changes to ${params.ENV}?"
        dir("${params.TERRAFORM_DIR}/CONFIG") {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'dev']]) {
            sh "terraform apply -auto-approve tfplan"
          }
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
    }
  }
}
