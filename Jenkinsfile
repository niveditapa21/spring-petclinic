pipeline {
    agent any
    tools {
        maven "maven"
        jdk "java"
     }
    stages {
        stage('Initialize'){
            steps{
                echo "PATH = ${M2_HOME}/bin:${PATH}"
                echo "M2_HOME = /opt/maven"
            }
        }
        stage('Build') {
            steps {
                dir("/var/lib/jenkins/workspace/demo2") {
                sh 'mvn -B -DskipTests clean package'
                }
            }
        }
        
     
      post {
          always {
             junit(
                  allowEmptyResults: true,
                  testResults: '*/test-reports/.xml'
        )
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
}
