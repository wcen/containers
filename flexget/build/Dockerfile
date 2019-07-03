FROM python:3.7-alpine
LABEL maintainer="cew1350@gmail.com"

ARG FLEXGET_VER="2.21.10"

ENV XDG_CONFIG_HOME=/config

RUN \
  apk update && \
  echo "**** install build packages ****" && \
  apk add --no-cache --virtual=build-dependencies \
    curl && \
  echo "**** install runtime packages ****" && \
  apk add --no-cache \
    tzdata && \
  echo "**** install flexget ****" && \
  mkdir -p /flexget-src && \
  curl -o /tmp/flexget-${FLEXGET_VER}.tar.gz -L "https://github.com/Flexget/Flexget/archive/${FLEXGET_VER}.tar.gz" && \
  tar zxf /tmp/flexget-${FLEXGET_VER}.tar.gz -C /flexget-src --strip-components=1 && \
  cd /flexget-src/ && \
  pip install -e . && \
  echo "**** cleanup ****" && \
  apk del --purge build-dependencies && \
  rm -rf /tmp/*

ADD start.sh /tmp/start.sh
ENTRYPOINT [ "/tmp/start.sh" ]
