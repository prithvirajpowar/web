pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = credentials('prithvirajpowar')
        DOCKERHUB_PASSWORD = credentials('Prithvi@5095')
    }

    stages {
        stage('Build') {
            steps {
                sh 'flutter clean'
                sh 'flutter packages get'
                sh 'flutter build apk'
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
    post {
        always {
            docker.image("prithvirajpowar/my-app:${env.BUILD_ID}").remove()
        }
    }
}
