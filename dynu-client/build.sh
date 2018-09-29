#!/bin/bash
set -e

IMG_TAG="latest"
docker build -t docker-dynu-client:${IMG_TAG} .
echo "Build docker-dynu-client:${IMG_TAG} finished!"
