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
        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/apk/release/app-release.apk', fingerprint: true
            }
        }
    }
}
