pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prithvirajpowar/Demo.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'flutter clean'
                sh 'flutter packages get'
                sh 'flutter build apk'
            }
        }
    }
}