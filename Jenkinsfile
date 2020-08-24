pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e ./src/templates/*.html'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'sudo docker build --tag=capstone .'
      }
    }

    stage('Push Docker Image to DockerHub') {
      steps {
        withDockerRegistry([url: "", credentialsId: "docker-hub"]) {
          echo "Pushing to DockerHub"
          sh "docker tag capstone subrockmann/udacity_capstone:v1"
          sh 'docker push subrockmann/udacity_capstone:v1'
        }
      }
    }

  }
}