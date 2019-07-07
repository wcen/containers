FROM alpine:3.10
LABEL maintainer="cew1350@gmail.com"

ARG QBITTORRENT_VER="4.1.6"
ARG RASTERBAR_VER="1.1.13"

ENV \
  XDG_CONFIG_HOME=/config \
  XDG_DATA_HOME=/data

RUN \
  apk update && \
  echo "**** install build packages ****" && \
  apk add --no-cache --virtual=build-dependencies \
    autoconf \
    automake \
    boost-dev \
    cmake \
    curl \
    file \
    g++ \
    geoip-dev \
    curl \
    libtool \
    make \
    qt5-qttools-dev && \
  echo "**** install runtime packages ****" && \
  apk add --no-cache \
    tzdata \
    boost-system \
    boost-thread \
    ca-certificates \
    geoip \
    qt5-qtbase \
    unrar && \
  echo "**** compile libtorrent rasterbar ****" && \
  mkdir -p /tmp/libtorrent-rasterbar-src && \
  curl -o /tmp/libtorrent-rasterbar-${RASTERBAR_VER}.tar.gz -L "https://github.com/arvidn/libtorrent/releases/download/libtorrent-${RASTERBAR_VER//./_}/libtorrent-rasterbar-${RASTERBAR_VER}.tar.gz" && \
  tar zxf /tmp/libtorrent-rasterbar-${RASTERBAR_VER}.tar.gz -C /tmp/libtorrent-rasterbar-src --strip-components=1 && \
  cd /tmp/libtorrent-rasterbar-src/ && \
  ./configure \
    --enable-encryption \
    --prefix=/usr && \
  make && \
  make install && \
  echo "**** compile qbittorrent ****" && \
  mkdir -p /tmp/qbittorrent-src && \
  curl -o /tmp/release-${QBITTORRENT_VER}.tar.gz -L "https://github.com/qbittorrent/qBittorrent/archive/release-${QBITTORRENT_VER}.tar.gz" && \
  tar zxf /tmp/release-${QBITTORRENT_VER}.tar.gz -C /tmp/qbittorrent-src --strip-components=1 && \
  cd /tmp/qbittorrent-src && \
  ./configure \
    --disable-gui \
    --prefix=/usr && \
  make && \
  make install && \
  echo "**** cleanup ****" && \
  apk del --purge build-dependencies && \
  rm -rf /tmp/*

EXPOSE 8080 8999 8999/udp
VOLUME [ "/config", "/data", "/downloads", "/watch" ]
ADD start.sh /tmp/start.sh
ENTRYPOINT [ "/tmp/start.sh" ]
