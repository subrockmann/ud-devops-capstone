pipeline {
  environment {
    eksClusterName = 'capstone'
    eksRegion = 'eu-central-1'
    imageVersion = 'v1'

  }

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
          sh "docker tag capstone subrockmann/udacity_capstone:$imageVersion"
          sh "docker push subrockmann/udacity_capstone:$imageVersion"
        }
      }
    }

    stage('Update kubeconfig') {
      steps {
        withAWS(credentials: 'Jenkins', region: eksRegion) {

          sh 'aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'


        }
      }
    }    

    stage('Deploy cluster') {
      steps {
        withAWS(credentials: 'Jenkins', region: eksRegion) {

          sh 'kubectl apply -f ./k8/deployment.yaml'
          sh 'kubectl get nodes'
          sh 'kubectl get pod -o wide'
          sh 'kubectl get deployment'
          sh 'kubectl get service/capstone-lb'
          // 
          sh "kubectl set image deployment/capstone-deployment capstone-app=subrockmann/udacity_capstone:$imageVersion"
        }
      }
    }  
  }
}