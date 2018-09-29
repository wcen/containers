docker run -d --restart=always --name qbittorrent \
  --net bridge --net internal \
  -v /share/qbittorrent/config:/config \
  -v /share/qbittorrent/data:/data \
  -v /share/qbittorrent/downloads:/downloads \
  -v /share/qbittorrent/watch:/watch \
  -p 8080:8080 \
  -p 8999:8999 \
  -p 8999:8999/udp \
  -e TZ="Asia/Taipei" \
  wcen/docker-qbittorrent:latest
