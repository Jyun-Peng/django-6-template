#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"/..

export $(grep -v '^#' config/.env | xargs)

podman build -t $IMAGE_NAME:$IMAGE_TAG .