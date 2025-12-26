#!/bin/bash

cd "$(dirname "$0")"/..

source scripts/set_env.sh

podman exec $CONTAINER_NAME python manage.py "$@"