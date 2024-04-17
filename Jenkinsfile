pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/haadiyeah/simple-reactjs-app' 
            }
        }

        stage('Dependency Installation') {
            steps {
                sh 'npm install' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("haadiyas-image") // replace with your image name
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    docker.image("haadiyas-image").run() // replace with your image name
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'hadis-dockerhub-credentials') { // replace 'docker-hub-credentials' with your actual Docker Hub credentials ID
                        docker.image("haadiyas-image").push() 
                    }
                }
            }
        }
    }
}