#!/bin/bash
set -e
CONTAINER_NAME="dynu-client"
docker stop ${CONTAINER_NAME} > /dev/null 2>&1 || true && docker rm -vf ${CONTAINER_NAME} > /dev/null 2>&1 || true

docker run -d --restart=always --name ${CONTAINER_NAME} \
  --env-file ./environment \
  wcen/docker-dynu-client:latest
