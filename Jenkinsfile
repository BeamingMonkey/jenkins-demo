pipeline {
    agent any

    environment {
        MINIKUBE_PROFILE = "minikube"
        IMAGE_NAME = "jenkins-demo:latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image inside Minikube Docker daemon"
                    sh '''
                    eval $(minikube -p $MINIKUBE_PROFILE docker-env)
                    docker build -t $IMAGE_NAME .
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo "Deploying app to Minikube Kubernetes cluster"
                    sh 'kubectl apply -f k8s-deployment.yaml'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    echo "Checking pods status"
                    sh 'kubectl get pods -l app=jenkins-demo'
                }
            }
        }
    }
}
