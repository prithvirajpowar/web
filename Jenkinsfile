pipeline {
    agent any
    
    stages { 
        stage('Build') {
            steps {
                sh 'flutter clean'
                sh 'flutter packages get'
                sh 'flutter build apk'
            }
        }
    }
}
