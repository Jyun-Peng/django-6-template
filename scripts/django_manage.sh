#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"/..

export $(grep -v '^#' config/.env | xargs)

podman run --rm \
    --workdir /src \
    -v ./src:/src:z \
    $IMAGE_NAME:$IMAGE_TAG \
    python manage.py "$@"