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
    stage('maven Build') {
      steps {
         withMaven(maven: 'maven') {
              sh "mvn clean package -DskipTests=true -Dcheckstyle.skip" 
              archive 'target/*.jar'
        
         }
      }
    }

     stage('Test Maven - JUnit') {
            steps {
              withMaven(maven: 'maven') {
              sh "mvn test -Dcheckstyle.skip"
              }
            }
     }
    
    stage('docker image creation & Push') {
      steps {
        sh 'docker build  -t  nivedita21/demo1 .'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
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
