#!/bin/sh
set -e

WEBUI_PORT=${WEBUI_PORT:-"8080"}

qbittorrent-nox --webui-port="${WEBUI_PORT}"
