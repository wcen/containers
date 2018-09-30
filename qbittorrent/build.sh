#!/bin/bash
set -e

IMG_TAG="latest"
docker build -t wcen/docker-qbittorrent:${IMG_TAG} .
echo "Build wcen/docker-qbittorrent:${IMG_TAG} finished!"
