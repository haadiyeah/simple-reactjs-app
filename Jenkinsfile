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
                    docker.build("haadiyas-image") 
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    docker.image("haadiyas-image").run()
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'hadis-dockerhub-credentials') { 
                        docker.image("haadiyas-image").push() 
                    }
                }
            }
        }
    }
}