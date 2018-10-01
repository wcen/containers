docker run -d --restart=always --name qbittorrent \
  --net bridge --net internal \
  --cpus=2 --memory=2048m \
  -v $(pwd)/config:/config \
  -v $(pwd)/data:/data \
  -v $(pwd)/downloads:/downloads \
  -v $(pwd)/watch:/watch \
  -p 8080:8080 \
  -p 8999:8999 \
  -p 8999:8999/udp \
  -e TZ="Asia/Taipei" \
  wcen/docker-qbittorrent:latest
