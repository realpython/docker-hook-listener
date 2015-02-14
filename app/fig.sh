#!/bin/bash

echo test
docker pull mjhea0/flask-docker-workflow
fig build
fig up -d