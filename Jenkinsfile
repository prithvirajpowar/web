pipeline {
  agent any

  stages {
    stage('Build Docker Image') {
      steps {
        // Checkout source code from GitHub
        git url: 'https://github.com/prithvirajpowar/dharati.git'

        // Build the Docker image
        script {
          sh 'docker.build("prithvirajpowar/app:${env.BUILD_ID}")'
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        // Run the Docker container
        script {
          sh 'docker.image("prithvirajpowar/app:${env.BUILD_ID}")
            .withRun('-p 8080:8080')'
        }
      }
    }
  }
}
