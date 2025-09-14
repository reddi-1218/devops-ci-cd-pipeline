pipeline {
  agent any
  environment {
    REGISTRY = credentials('docker_registry') // set Jenkins credential id
    IMAGE_NAME = "your-docker-username/devops-task-sample"
    // For AWS ECR you'd inject AWS credentials and region variables
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Install & Test') {
      steps {
        sh 'npm ci'
        sh 'npm test'
      }
    }
    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
        }
      }
    }
    stage('Push Image') {
      steps {
        script {
          // Example: DockerHub
          sh "echo $REGISTRY_PSW | docker login -u $REGISTRY_USR --password-stdin"
          sh "docker push ${IMAGE_NAME}:${env.BUILD_NUMBER}"
        }
      }
    }
    stage('Deploy') {
      steps {
        // This is a placeholder. Use kubectl/ecs deploy commands or Terraform apply with proper credentials.
        echo "Deploy step: run kubectl/ecs/terraform to update the service with image ${IMAGE_NAME}:${env.BUILD_NUMBER}"
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: '**/logs/*.log', allowEmptyArchive: true
    }
  }
}
