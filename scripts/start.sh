#!/bin/bash

cd "$(dirname "$0")"/..

source scripts/set_env.sh

podman run -d --name $CONTAINER_NAME --replace \
    -p $HTTP_PORT:80 \
    -p $HTTPS_PORT:443 \
    -v ./src:/src \
    $IMAGE_NAME:$IMAGE_TAG