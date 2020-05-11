#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

IMAGE_NAME=$(cat "${SCRIPT_DIR}/image.txt");
IMAGE_TAG=$(cat "${SCRIPT_DIR}/version.txt");
IMAGE="${IMAGE_NAME}:${IMAGE_TAG}"

echo "Pushing tag: ${IMAGE}"

docker push "${IMAGE}"
