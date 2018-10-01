docker run -d --restart=always --name flexget \
  --net bridge --net internal \
  -v $(pwd)/config/config.yml:/config/flexget/config.yml \
  -v $(pwd)/config/variables.yml:/config/flexget/variables.yml \
  -e TZ=Asia/Taipei \
  wcen/docker-flexget:latest
