#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

VARIABLES=$(realpath "${SCRIPT_DIR}/../variables.txt")
# shellcheck source=../variables.txt
source "${VARIABLES}"


TARGET="${CONTAINER_REGISTRY}${APP_IMAGE}:${APP_IMAGE_TAG}"

echo "Pushing image: ${TARGET}"

docker push "${TARGET}"
