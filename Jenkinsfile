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
                ssh -i /var/lib/jenkins/us_key_pair.pem -o StrickHostKeyChecking=no ubuntu@ec2-35-172-191-143.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
                '''
            }
        }
    }
}