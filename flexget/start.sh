#!/bin/sh
set -e

if [[ ! -f ${XDG_CONFIG_HOME}/flexget/config.yml ]]; then
  echo "config.yml not found!" && \
  exit 1
else
  flexget --loglevel "info" daemon start
fi
