#!/bin/bash

cd "$(dirname "$0")"/..

source scripts/set_env.sh

podman build -t $IMAGE_NAME:$IMAGE_TAG .