pipeline {
    agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  stages {
      stage('Checkout') {
          steps {
            cleanWs()
            git credentialsId: 'GitHubCreds', url: 'https://github.com/daniel-develeap/oracledb-temp.git'
          }
      }
    stage('Build') {
      steps {
          // Download " Linux x86-64" under "Oracle Database 12c Release 2" from "http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html"
          // Put downloaded file inside path "OracleDatabase/SingleInstance/dockerfiles/12.2.0.1/""

      sh '''cd OracleDatabase/SingleInstance/dockerfiles/
      ./buildDockerImage.sh -v 12.2.0.1 -e
      '''
      sh 'docker tag oracle/database:12.2.0.1 daniel570/oracledb:12.2.0.1'

      sh '''
      ls -la db-migrate
      cd db-migrate/docker-files
      svcIp=$(kubectl get service/oracledb -o yaml | grep clusterIP | cut -d ":" -f 2)
      #curIp=$(cat import-data.sh | cut -d "@" -f 2 | cut -d ":" -f 1 | grep 10.*.*.*)
      ./curip.sh
      curIp=$(cat curip.txt)
      echo $curIp
      sed -i -e s/"$curIp"/"$svcIp"/g import-data.sh
      sed -i -e "s/@ /@/g" import-data.sh
      cat import-data.sh
      docker build -t daniel570/oracledb:instantclient-12.2.0.1 -f Dockerfile.dbclient .
      ''' 
      }
    }
    
    stage('Publish') {
      steps {
         sh 'echo "publish"'
         withDockerRegistry(credentialsId: 'DockerHubCreds', url: 'https://index.docker.io/v1/') {
         sh 'docker push daniel570/oracledb:instantclient-12.2.0.1'
          }
        }
      }
       stage('Deploy') {
        steps {
         sh 'kubectl apply -f helm-charts/appdb-chart/controllers/job.yaml'
      }
    }
  }
}
