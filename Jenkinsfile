pipeline {
  agent any
 
  environment {
    IMAGE_NAME = "ecom-app"
    DEV_REPO   = "pranathi20222/ecomm_publicrepo"
    PROD_REPO  = "pranathi20222/ecomm_privaterepo"
  }
 
  stages {
 
    stage('Checkout') {
      steps {
        // Multibranch pipeline auto-checkout
        checkout scm
      }
    }
 
    stage('Build Docker Image') {
      steps {
        sh """
          echo "Building Docker image for branch: ${BRANCH_NAME}"
          ./build.sh ${IMAGE_NAME} ${BRANCH_NAME}
        """
      }
    }
 
    stage('Docker Login & Push Image') {
      steps {
        script {
          withCredentials([
            usernamePassword(
              credentialsId: 'dockerhubcreds',
              usernameVariable: 'DOCKER_USER',
              passwordVariable: 'DOCKER_PASS'
            )
          ]) {
 
            sh '''
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            '''
 
            if (env.BRANCH_NAME == 'dev') {
              sh """
                docker tag ${IMAGE_NAME}:dev ${DEV_REPO}:latest
                docker push ${DEV_REPO}:latest
              """
            }
 
            if (env.BRANCH_NAME == 'prod') {
              sh """
                docker tag ${IMAGE_NAME}:prod ${PROD_REPO}:latest
                docker push ${PROD_REPO}:latest
              """
            }
          }
        }
      }
    }
 
    stage('Deploy to Server') {
      when {
        branch 'prod'
      }
      steps {
        sh """
          ./deploy.sh ${PROD_REPO} latest
        """
      }
    }
  }
 
  post {
    success {
      echo "✅ Pipeline SUCCESS for branch: ${BRANCH_NAME}"
    }
    failure {
      echo "❌ Pipeline FAILED for branch: ${BRANCH_NAME}"
    }
  }
}