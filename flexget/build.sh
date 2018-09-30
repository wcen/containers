#!/bin/bash
set -e

IMG_TAG="latest"
docker build -t wcen/docker-flexget:${IMG_TAG} .
echo "Build wcen/docker-flexget:${IMG_TAG} finished!"

