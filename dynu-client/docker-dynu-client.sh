docker stop dynu-client > /dev/null 2>&1 || true && docker rm -vf dynu-client > /dev/null 2>&1 || true
docker run -d --restart=always --name dynu-client \
  --env-file ./environment \
  wcen/docker-dynu-client:latest
