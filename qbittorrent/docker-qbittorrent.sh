docker run -d --restart=always --name qbittorrent \
  --net bridge --net internal \
  --cpus=2 --memory=2048m \
  -v $(pwd)/qbittorrent/config:/config \
  -v $(pwd)/qbittorrent/data:/data \
  -v $(pwd)/qbittorrent/downloads:/downloads \
  -v $(pwd)/qbittorrent/watch:/watch \
  -p 8080:8080 \
  -p 8999:8999 \
  -p 8999:8999/udp \
  -e TZ="Asia/Taipei" \
  wcen/docker-qbittorrent:latest
