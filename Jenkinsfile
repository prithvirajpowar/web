pipeline {
    agent any
    
    stages {
        
        
        stage('Build web') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build web'
            }
        }
    }
}
