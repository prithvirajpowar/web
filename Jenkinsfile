pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prithvirajpowar/flutter-project.git'
            }
        }
        
        stage('Build APK') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t app .'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push app'
                }
            }
        }
    }
}
