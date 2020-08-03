#!/usr/bin/env bash

kubectl replace --force -f app-deployment.yaml --wait
