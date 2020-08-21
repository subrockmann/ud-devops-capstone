pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e ./src/templates/*.html'
      }
    }

    stage('Build Docker IMAGE') {
      steps {
        sh 'docker build --tag=subrockmann/udacity_capstone:v1 .'
      }
    }

  }
}