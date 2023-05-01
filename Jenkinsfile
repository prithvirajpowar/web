pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "prithvirajpowar/dharati"
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
            }
        }
        
        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def appImage = docker.build(env.DOCKER_IMAGE, ".")
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        appImage.push("${DOCKERHUB_USERNAME}", "${DOCKERHUB_PASSWORD}")
                    }
                }
            }
        }
    }
}
