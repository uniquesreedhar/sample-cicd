pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        DOCKERHUB_CRED = credentials('dockerhub')
        // Define the Docker image name and tag
        IMAGE_NAME = 'sreedhar8897/html-server'
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
                    // Build the Docker image
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")

                    // Log in to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', DOCKERHUB_CRED) {
                        // Push the Docker image to Docker Hub
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
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
