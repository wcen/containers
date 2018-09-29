# docker-dynu-client
### Login in https://www.dynu.com/en-US/ and get your ddns domain.

__docker run__

```sh
docker run -d --restart=always --name dynu-client \
  -e MY_HOSTNAME=$ddns_domain \
  -e MY_USER=$user \
  -e MY_PASS=$secret \
  wcen/docker-dynu-client:latest
```

__parameters__
>MY_HOSTNAME: ddns domain  
>MY_USER: dynu login user (usally e-mail or account)  
>MY_PASS: can use encryption password  

