#!/bin/bash
set -e

IMG_TAG="latest"
docker build -t docker-flexget:${IMG_TAG} .
echo "Build docker-flexget:${IMG_TAG} finished!"

