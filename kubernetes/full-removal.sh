#!/usr/bin/env bash

# Note: This removes EVERYTHING.

kubectl delete -f secret/database-secret.yaml
kubectl delete -f secret/app-secret.yaml

kubectl delete -f app-data.yaml

kubectl delete -f app-deployment.yaml
kubectl delete -f game.yaml

kubectl delete -f app-balancer.yaml
kubectl delete -f game-balancer.yaml
kubectl delete -f ingress.yaml

helm uninstall nginx-ingress stable/nginx-ingress \
    --namespace viaroadsafety

kubectl delete -f namespace.yaml
