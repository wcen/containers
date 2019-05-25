#!/bin/bash
set -e

docker rm -vf archisteamfarm > /dev/null 2>&1 || true

docker run -itd --rm --name archisteamfarm \
  --cpus=1 --memory=256m \
  -v $(pwd)/config:/app/config \
  justarchi/archisteamfarm:4.0.1.9

docker attach archisteamfarm
