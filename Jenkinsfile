pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "saurabh9jadhav/node-docker-jenkins"
        AWS_SSH = "ubuntu@13.127.243.254"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/saurabh-jadhav-09/node-docker-jenkins.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to AWS EC2') {
            steps {
                sshagent(['aws-ssh-key']) {
                    sh 'scp -o StrictHostKeyChecking=no scripts/deploy.sh $AWS_SSH:/home/ubuntu/deploy.sh'
                    sh 'ssh -o StrictHostKeyChecking=no $AWS_SSH "chmod +x deploy.sh && ./deploy.sh"'
                }
            }
        }
    }
}

