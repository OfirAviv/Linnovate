pipeline {
    agent any
    environment {
        registry = "myregistry.com/myimage"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage('Cloning Git') {
            steps {
                checkout scm
            }
        }
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry+":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps{
                script {
                    if (env.BRANCH_NAME == 'develop') {
                        sh("kubectl apply -f kube/deployment.yaml")
                    }
                }
            }
        }
        stage('Master Deploy'){
            when {
                branch 'master'
            }
            steps {
                input message: 'Approve deployment?'
                sh("kubectl apply -f kube/deployment.yaml")
            }
        }
    }
}