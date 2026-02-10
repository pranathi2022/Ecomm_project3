#!/bin/bash
IMAGE_NAME=$1
TAG=$2

docker stop app-container || true
docker rm app-container || true

docker run -d \
  --name app-container \
  -p 80:80 \
  ${IMAGE_NAME}:${TAG}
