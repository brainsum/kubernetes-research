#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

IMAGE_NAME=$(cat "${SCRIPT_DIR}/image.txt");
IMAGE_TAG=$(cat "${SCRIPT_DIR}/version.txt");
IMAGE="${IMAGE_NAME}:${IMAGE_TAG}"

echo "Building tag: ${IMAGE}"

docker build --rm -f "${SCRIPT_DIR}/Dockerfile" -t "${IMAGE}" --build-arg BASE_IMAGE_TAG="${IMAGE_TAG}" "${SCRIPT_DIR}/../.."