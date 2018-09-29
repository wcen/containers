# docker-reverse-proxy

__docker run__

```sh
docker run -d --restart=always --name reverse-proxy \
  --net bridge --net internal \
  -p 50443:443 \
  -v /share/Public/nginx-conf:/etc/nginx/conf.d \
  -v /share/Public/nginx-ssl:/etc/nginx/ssl \
  nginx:alpine
```

__generate self-signed cert__

```sh
bash self-signed-ssl-create.sh
```

Ref. [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04)

> nginx-ssl/private/nginx-selfsigned.key  
> nginx-ssl/certs/dhparam.pem  
> nginx-ssl/certs/nginx-selfsigned.crt  

__nginx conf__

> nginx-conf/default.conf  
> nginx-conf/ssl-params.conf  
> nginx-conf/ssl.conf  
