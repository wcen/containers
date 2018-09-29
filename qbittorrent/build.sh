#!/bin/bash
set -e

IMG_TAG="latest"
docker build -t docker-qbittorrent:${IMG_TAG} .
echo "Build docker-qbittorrent:${IMG_TAG} finished!"
