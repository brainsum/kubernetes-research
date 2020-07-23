#!/usr/bin/env bash

echo "Linting kubernetes-research-php/Dockerfile"
docker run --rm -i hadolint/hadolint < kubernetes-research-php/Dockerfile
echo ""
echo "Linting k8sdemo-nginx/Dockerfile"
docker run --rm -i hadolint/hadolint < k8sdemo-nginx/Dockerfile
