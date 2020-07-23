#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

VARIABLES=$(realpath "${SCRIPT_DIR}/../variables.txt")
# shellcheck source=../variables.txt
source "${VARIABLES}"

CONTEXT=$(realpath "${SCRIPT_DIR}")

echo "Building webserver image: ${WEBSERVER_IMAGE}:${WEBSERVER_IMAGE_TAG}"
echo "Context: ${CONTEXT}"

echo "Src code: ${APP_IMAGE}:${APP_IMAGE_TAG}"

DOCKER_BUILDKIT=1 docker build \
    --rm \
    -f "${SCRIPT_DIR}/Dockerfile" \
    -t "${CONTAINER_REGISTRY}${WEBSERVER_IMAGE}:${WEBSERVER_IMAGE_TAG}" \
    --build-arg BASE_IMAGE="${WEBSERVER_BASE_IMAGE}:${WEBSERVER_BASE_IMAGE_TAG}" \
    --build-arg SOURCE_CODE_IMAGE="${CONTAINER_REGISTRY}${APP_IMAGE}:${APP_IMAGE_TAG}" \
    "${CONTEXT}"
