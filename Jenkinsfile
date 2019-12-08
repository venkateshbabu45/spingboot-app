pipeline {
  agent any
  tools { 
        maven 'Maven'
        jdk 'Java'
  }
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'mvn -B -DskipTests clean package'
        sh 'echo $USER'
        sh 'echo whoami'
      }
    }
    stage('Docker Build') {
      steps {
        sh '/usr/bin/docker build -t springbootapp .'
      }
    }   
    stage('push image to ECR'){
      steps {
        withDockerRegistry(credentialsId: 'ecr:us-east-1:aws-credentials', url: 'http://508607970941.dkr.ecr.us-east-1.amazonaws.com/springbootapp') {
          sh 'docker tag employee-service:latest 508607970941.dkr.ecr.us-east-1.amazonaws.com/springbootapp:latest'
         sh 'docker push 508607970941.dkr.ecr.us-east-1.amazonaws.com/springbootapp:latest'
        } 
      }
    }
    stage('deploy to ECR') {
      steps {
        node('eks-master-node'){
          checkout scm
         
        }
      }
    }
 
  }
}
