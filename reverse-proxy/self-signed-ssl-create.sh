#!/bin/bash
# Ref. https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
#

BASEDIR=$(dirname "${0}")
PRI_KEY_DIR="${BASEDIR}/nginx-ssl/private"
KEY_NAME="nginx-selfsigned.key"
CERT_DIR="${BASEDIR}/nginx-ssl/certs"
CERT_NAME="nginx-selfsigned.crt"
DH_KEY="dhparam.pem"

command -v openssl

if [[ $? == 0 ]]; then
  [[ -d "${PRI_KEY_DIR}" ]] || \
  mkdir "${PRI_KEY_DIR}"

  [[ -d "${CERT_DIR}" ]] || \
  mkdir "${CERT_DIR}"

  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "${PRI_KEY_DIR}/${KEY_NAME}" -out "${CERT_DIR}/${CERT_NAME}"
  # Diffie–Hellman key exchange
  openssl dhparam -out "${CERT_DIR}/${DH_KEY}" 2048
else
  echo "openssl command not found!" && \
  exit 1
fi
