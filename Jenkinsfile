pipeline {
    agent {
        docker {
            image 'docker'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        DOCKER_USERNAME = credentials('prithvirajpowar').username
        DOCKER_PASSWORD = credentials('Prithvi@5095').password
    }

    stages {
        stage('Build and test') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t my-flutter-app .'
            }
        }

        stage('Push to Docker registry') {
            steps {
                sh 'chown -R jenkins:jenkins $WORKSPACE'
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin"
                }
                sh 'docker push my-flutter-app'
            }
        }
    }
}
