# docker-reverse-proxy

__docker run__

```sh
docker run -d --restart=always --name reverse-proxy \
  --net bridge --net internal \
  -p 50080:80 \
  -v /share/Public/nginx-conf:/etc/nginx/conf.d \
  nginx:alpine
```

__nginx conf__

> nginx-conf/default.conf  
