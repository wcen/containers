docker run -d --restart=always --name flexget \
  --net bridge --net internal \
  -v /share/Public/flexget-conf/config.yml:/config/flexget/config.yml \
  -v /share/Public/flexget-conf/variables.yml:/config/flexget/variables.yml \
  -e TZ=Asia/Taipei \
  wcen/docker-flexget:latest
