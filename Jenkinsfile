pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS=credentials('2fd95e17-63a3-494f-b5c8-e592fab26cde')
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
        sh 'docker build -t nivedita21/demo1 .'
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
