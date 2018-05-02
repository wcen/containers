#!/bin/sh
set -ex

MY_HOSTNAME=${MY_HOSTNAME:-""}
GET_IP_SERVER=${GET_IP_SERVER:-"http://ipecho.net/plain"}
MY_USER=${MY_USER:-""}
MY_PASS=${MY_PASS:-""}
WAIT_TIME=${WAIT_TIME:-"10"}

while true; do
  EXT_IP=${EXT_IP:-$(curl -s $GET_IP_SERVER)}
  curl "https://api.dynu.com/nic/update?hostname=$MY_HOSTNAME&myip=$EXT_IP&username=$MY_USER&password=$MY_PASS"
  sleep $WAIT_TIME
done
