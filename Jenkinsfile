pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t myflutterapp .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 80:80 myflutterapp'
            }
        }
    }
}
