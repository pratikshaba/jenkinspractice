pipeline {
    agent any

    environment {
        IMAGE_NAME = "java-demo"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build \
                -t ${IMAGE_NAME}:${IMAGE_TAG} .
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'dhanasvi',
                        passwordVariable: 'dhanasvi'
                    )
                ]) {

                    sh """
                    echo \$DOCKER_PASS | docker login \
                    -u \$DOCKER_USER \
                    --password-stdin

                    docker tag \
                    ${IMAGE_NAME}:${IMAGE_TAG} \
                    \$DOCKER_USER/${IMAGE_NAME}:${IMAGE_TAG}

                    docker push \
                    \$DOCKER_USER/${IMAGE_NAME}:${IMAGE_TAG}

                    docker logout
                    """
                }
            }
        }
    }
}
