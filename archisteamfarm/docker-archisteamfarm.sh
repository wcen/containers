#!/bin/bash
set -e

docker stop archisteamfarm || true && docker rm -vf archisteamfarm || true

docker run -itd --rm --name archisteamfarm \
  --cpus=1 --memory=256m \
  -v $(pwd)/config/bot.json:/app/config/bot.json \
  justarchi/archisteamfarm:latest
