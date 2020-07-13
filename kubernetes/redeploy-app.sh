#!/usr/bin/env bash

kubectl delete -f app-deployment.yaml --wait
kubectl apply -f app-deployment.yaml --wait
