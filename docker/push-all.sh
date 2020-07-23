#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

bash "${SCRIPT_DIR}/kubernetes-research-php/push.sh"
bash "${SCRIPT_DIR}/k8sdemo-nginx/push.sh"
