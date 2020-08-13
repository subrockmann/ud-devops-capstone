pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sudo sh 'tidy -q -e ./src/templates/*.html'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh './run_docker.sh'
      }
    }

  }
}