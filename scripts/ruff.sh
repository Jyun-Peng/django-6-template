#!/bin/bash

cd "$(dirname "$0")"/..

source scripts/set_env.sh

podman run --rm \
    --workdir /src \
    -v ./src:/src:z \
    -v ./ruff.toml:/ruff.toml:z \
    $IMAGE_NAME:$IMAGE_TAG \
    ruff "$@"