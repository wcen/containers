docker run -d --restart=always --name reverse-proxy \
  --net bridge --net internal \
  -p 50443:443 \
  -v /share/Public/nginx-conf:/etc/nginx/conf.d \
  -v /share/Public/nginx-ssl:/etc/nginx/ssl \
  nginx:alpine