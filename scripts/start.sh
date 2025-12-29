#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"/..

export $(grep -v '^#' config/.env | xargs)

podman run -d --name $CONTAINER_NAME --replace \
    -p $HTTP_PORT:80 \
    -p $HTTPS_PORT:443 \
    -v ./src:/src:z \
    $IMAGE_NAME:$IMAGE_TAG