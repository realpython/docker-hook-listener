#!/bin/bash

docker pull mjhea0/flask-docker-workflow
docker stop flask
docker rm flask
docker run --name flask -d -p 80:80 mjhea0/flask-docker-workflow