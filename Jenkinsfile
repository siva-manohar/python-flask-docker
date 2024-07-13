pipeline {
    stages {
        stage ("build") {
            steps {
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183962065.dkr.ecr.us-east-1.amazonaws.com
                docker build -f Dockerfile -t python-project:${BUILD_NUMBER} .
                docker tag python-project:${BUILD_NUMBER} 590183962065.dkr.ecr.us-east-1.amazonaws.com/python-project:${BUILD_NUMBER}
                docker push 590183962065.dkr.ecr.us-east-1.amazonaws.com/python-project:${BUILD_NUMBER}
                '''
            }
        }

        stage ("deploy") {
            steps {
                sh '''
                docker pull 590183962065.dkr.ecr.us-east-1.amazonaws.com/python-project:${BUILD_NUMBER}
                docker run -itd -p 8080:8080 --name python-project 590183962065.dkr.ecr.us-east-1.amazonaws.com/python-project:${BUILD_NUMBER}
                '''
            }
        }
    }
}