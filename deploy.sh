#!/bin/bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183962065.dkr.ecr.us-east-1.amazonaws.com

docker pull 590183962065.dkr.ecr.us-east-1.amazonaws.com/python-project:$1

docker run -itd -p 8080:8080 --name python-script-2 590183962065.dkr.ecr.us-east-1.amazonaws.com/python-project:$1
