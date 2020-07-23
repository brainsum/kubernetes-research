#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

bash "${SCRIPT_DIR}/kubernetes-research-php/build.sh"
bash "${SCRIPT_DIR}/k8sdemo-nginx/build.sh"
