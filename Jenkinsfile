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

        // Multibranch pipeline automatically checks out correct branch

        checkout scm

      }

    }
 
    stage('Build Docker Image') {

      steps {

        sh """

          echo "Building image for branch: ${BRANCH_NAME}"

          ./build.sh ${IMAGE_NAME} ${BRANCH_NAME}

        """

      }

    }
 
    stage('Push Docker Image') {

      steps {

        script {
 
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

      echo "Pipeline completed successfully for ${BRANCH_NAME}"

    }

    failure {

      echo "Pipeline failed for ${BRANCH_NAME}"

    }

  }

}