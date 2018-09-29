# docker-flexget

__docker run__
```sh
docker run -d --restart=always --name flexget \
  --net bridge --net internal \
  -v /share/Public/flexget-conf/config.yml:/config/flexget/config.yml \
  -v /share/Public/flexget-conf/variables.yml:/config/flexget/variables.yml \
  -e TZ=Asia/Taipei \
  wcen/docker-flexget:latest
```

__config.yml__
```sh
variables: variables.yml
web_server: no
schedules:
  - tasks: '*'
    interval:
      minutes: 1
templates:
  anchors:
    _tasks: &tasks
      accept_all: yes
      no_entries_ok: yes
    _qbittorrent: &qbittorrent
      host: '{? qbt.host ?}'
      port: 8080
      username: '{? qbt.usr ?}'
      password: '{? qbt.pwd ?}'
  ttg:
    <<: *tasks
    rss: '{? rss.ttg ?}'
    qbittorrent:
      <<: *qbittorrent
      label: ttg
  mteam:
    <<: *tasks
    rss: '{? rss.mteam ?}'
    qbittorrent:
      <<: *qbittorrent
      label: mteam
tasks:
  TTG:
    template: ttg
  MTEAM:
    template: mteam
```

__variables.yml__
```sh
qbt:
  host: qbittorrent
  port: 8080
  usr: ****
  pwd: ****
rss:
  ttg: ****
  mteam: ****
```