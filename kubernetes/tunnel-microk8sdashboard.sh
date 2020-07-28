#!/usr/bin/env bash

DASH_PORT=8443

echo "Dashboard token:"
#kubectl get secret --namespace demok8s loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

echo "Visit https://localhost:${DASH_PORT} for dashboard."

POD_NAME=$(kubectl get pods --namespace kube-system -l "k8s-app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace kube-system port-forward "${POD_NAME}" "${DASH_PORT}"
