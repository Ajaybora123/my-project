pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "🔹 Cloning Terraform code from GitHub..."
                git 'https://github.com/YOUR_USERNAME/terraform-demo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "🔹 Initializing Terraform..."
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "🔹 Generating Terraform plan..."
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def userInput = input message: 'Apply Terraform changes?', ok: 'Yes, apply'
                    echo "🔹 Applying Terraform..."
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            echo "🧹 Cleaning workspace..."
            deleteDir()
        }
    }
}
