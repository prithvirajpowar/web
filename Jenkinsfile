pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = credentials('prithvirajpowar')
        DOCKERHUB_PASSWORD = credentials('Prithvi@5095')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'flutter clean'
                sh 'flutter pub get'
                sh 'flutter build web --release'
            }
        }

        stage('Dockerize') {
            steps {
                script {
                    def appImage = docker.build("prithvirajpowar/my-app:${env.BUILD_ID}", "-f Dockerfile .")
                    appImage.push("latest")
                    appImage.push("prithvirajpowar/my-app:${env.BUILD_ID}")
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
                        appImage.push('latest')
                        appImage.push("${env.BUILD_ID}")
                    }
                }
            }
        }
    }
}
