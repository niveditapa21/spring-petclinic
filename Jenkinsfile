pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS=credentials('071f0c60-f5b5-4a20-a2c2-7a5885d6458a')
  }
  stages {
    stage("git") {
            
            steps {
                
                git branch: "main",

                url:  'https://github.com/niveditapa21/spring-petclinic.git'
            }
        }
    stage('Build') {
      steps {
        
        sh 'docker build  --tag  nivedita21/demo1 .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push nivedita21/demo1'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
