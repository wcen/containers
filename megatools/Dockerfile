FROM alpine:3.6
MAINTAINER wcen <cew1350@gmail.com>

ENV MEGATOOLS_VERSION 1.9.98

# Install packages
RUN apk update && \
  apk add --no-cache \
  curl-dev \
  glib-dev \
  openssl-dev

# Install build packages
RUN apk add --no-cache --virtual=build-dependencies \
  make \
  g++ \
  wget \
  asciidoc

# Download source code and build
RUN cd /tmp && \
  wget https://megatools.megous.com/builds/megatools-${MEGATOOLS_VERSION}.tar.gz && \
  tar zxf megatools-${MEGATOOLS_VERSION}.tar.gz && \
  cd megatools-${MEGATOOLS_VERSION} && \
  ./configure && \
  make && \
  make install

# Cleanup
RUN apk del --purge build-dependencies && \
  rm -rf \
  /tmp/* \
  /var/tmp/* \
  /var/cache/apk/*

WORKDIR /megatools