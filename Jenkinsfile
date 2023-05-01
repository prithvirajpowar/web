pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "myflutterapp"
        DOCKER_FILE_PATH = "Dockerfile"
    }
    
    stages {
        stage('Build APK') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE, "--file ${env.DOCKER_FILE_PATH} .")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
