#!/bin/bash

cd "$(dirname "$0")"/..

source scripts/set_env.sh

podman stop $CONTAINER_NAME && podman rm $CONTAINER_NAME