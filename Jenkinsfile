pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "my-docker-image"
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prithvirajpowar/flutter-project.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
            }
        }
        
        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/apk/release/app-release.apk', fingerprint: true
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE)
                }
            }
        }
    }
}
