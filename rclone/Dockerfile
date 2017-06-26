FROM alpine:3.6
MAINTAINER wcen <cew1350@gmail.com>

ENV RCLONE_VERSION="v1.36"
ENV PLATFORM_ARCH="amd64"

# Install packages
RUN apk update && \
  apk add --no-cache ca-certificates

# Install build packages
RUN apk add --no-cache --virtual=build-dependencies \
  wget \
  unzip

# Download rclone binary
RUN cd /tmp && \
  wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${PLATFORM_ARCH}.zip && \
  unzip /tmp/rclone-${RCLONE_VERSION}-linux-${PLATFORM_ARCH}.zip && \
  cp -p /tmp/rclone-*-linux-${PLATFORM_ARCH}/rclone /usr/bin

# Clenaup
RUN apk del --purge \
  build-dependencies

RUN rm -rf \
  /tmp/* \
  /var/tmp/* \
  /var/cache/apk/*

ENTRYPOINT ["rclone"]
