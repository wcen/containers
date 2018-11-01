# docker-dynu-client
### Login in https://www.dynu.com/en-US/ and get your ddns domain.

__docker run__

```sh
docker run -d --restart=always --name dynu-client \
  --env-file ./environment \
  wcen/docker-dynu-client:latest
```

__environment__

**DYNU_DOMAIN**  is your dynamic domain, login [Dynu Website](https://www.dynu.com/en-US/ControlPanel/DDNS) and create new one.  
**DYNU_API_KEY**  is your dynu access key, you can get this key from <https://www.dynu.com/en-US/ControlPanel/APICredentials>  
