pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        // DOCKERHUB_CRED = credentials('dockerhub')
        // Define the Docker image name and tag
        IMAGE_NAME = 'html-server'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your version control system
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                   withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                sh 'echo $USER'
                sh "echo $PASS | docker login -u $USER --password-stdin"
                sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} $USER/${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker push $USER/${IMAGE_NAME}:${IMAGE_TAG}"
                }
                    }
                }
            }
        }
    

    post {
        success {
            echo 'Image built and pushed successfully!'
        }
    }
}
