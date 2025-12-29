#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"/..

export $(grep -v '^#' config/.env | xargs)

podman run --rm \
    --workdir /src \
    -v ./src:/src:z \
    -v ./ruff.toml:/ruff.toml:z \
    $IMAGE_NAME:$IMAGE_TAG \
    ruff "$@"