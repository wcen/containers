#!/bin/bash
set -e

VERSION="latest"

docker build -t wcen/dynu-ddns-client:$VERSION .
