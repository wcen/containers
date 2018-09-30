#!/bin/bash
set -e

IMG_TAG="latest"
docker build -t wcen/docker-dynu-client:${IMG_TAG} .
echo "Build wcen/docker-dynu-client:${IMG_TAG} finished!"
