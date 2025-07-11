#!/bin/bash
set -e
IMAGE_NAME="${DOCKER_IMAGE_NAME:-seuusuario/sua-api}"
TAG="latest"

docker build -t $IMAGE_NAME:$TAG .
docker push $IMAGE_NAME:$TAG
