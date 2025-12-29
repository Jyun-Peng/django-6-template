#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"/..

export $(grep -v '^#' config/.env | xargs)

podman stop $CONTAINER_NAME && podman rm $CONTAINER_NAME