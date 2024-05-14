pipeline {
    agent { label 'master || built-in' } 
    
    stages {
        stage('Build') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/emirhanyuksel/jenkins-test.git'
                sh 'mvn install -B'
            }
        }
        stage('Test') {
            steps {
                sh 'java -jar target/my-app-1.0-SNAPSHOT.jar'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t yukselemirhan/emirhan-jenkins-test .' //Replace with your own dockerhub username + container name
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                sh 'sudo docker login --username test123 --password test123 docker.io' //Replace with your own username and password + container name
                sh 'sudo docker push yukselemirhan/emirhan-jenkins-test'
            }
        }
        
        stage('Run Container on Remote Machine') {
            agent { label 'ubuntu-slave' } 
            steps {
                sh 'docker pull yukselemirhan/emirhan-jenkins-test' //Replace with your own dockerhub username + container name

                sh 'docker run --rm yukselemirhan/emirhan-jenkins-test' 
            }
        }
    }
}
