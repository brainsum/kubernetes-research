#!/usr/bin/env bash

GRAFANA_PORT=3000

echo "Grafana password:"
kubectl get secret --namespace demok8s loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

echo "Visit http://localhost:${GRAFANA_PORT} for grafana."

POD_NAME=$(kubectl get pods --namespace demok8s -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=loki-grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace demok8s port-forward "${POD_NAME}" "${GRAFANA_PORT}"
