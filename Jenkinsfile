pipeline {
  agent any

  stages {
    stage('Build Docker Image') {
      steps {
        // Checkout source code from GitHub
        git url: 'https://github.com/prithvirajpowar/dharati.git'

        // Build the Docker image
        script {
          docker.build("prithvirajpowar/app:${env.BUILD_ID}")
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        // Run the Docker container
        script {
          docker.image("prithvirajpowar/app:${env.BUILD_ID}")
            .withRun('-p 8080:8080') {
              // Execute any necessary commands inside the container
            }
        }
      }
    }
  }
}
