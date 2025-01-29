#!/bin/bash

# Stop existing container
docker stop node-app || true
docker rm node-app || true

# Pull latest image
docker pull saurabh9jadhav/node-docker-jenkins:latest

# Run container
docker run -d -p 3000:3000 --name node-app saurabh9jadhav/node-docker-jenkins

