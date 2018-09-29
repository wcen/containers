docker run -d --restart=always --name dynu-client \
  -e MY_HOSTNAME="" \
  -e MY_USER='' \
  -e MY_PASS="" \
  wcen/docker-dynu-client:latest
