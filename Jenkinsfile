
pipeline {
    # environment {
    #    USER_CREDENTIALS = credentials('dockerhub')
    # }

    agent any

    stages {
        stage('Lint HTML') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh './run_docker.sh'
            }
        }
    }
}