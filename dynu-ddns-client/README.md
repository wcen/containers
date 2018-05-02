
### Login in https://www.dynu.com/en-US/ and get your ddns domain.

```sh
docker run -d --name dynu-ddns-client \
  -e MY_HOSTNAME=$ddns_domain \
  -e MY_USER=$user \
  -e MY_PASS=$secret \
  wcen/dynu-ddns-client:latest
```