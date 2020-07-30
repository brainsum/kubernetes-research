#!/usr/bin/env bash

SOLR_PORT=8983

POD_NAME=$(kubectl get pods --namespace demok8s -l "app=solr,component=server,release=solr" -o jsonpath="{ .items[0].metadata.name }")
echo "Visit http://127.0.0.1:${SOLR_PORT} to access Solr"
kubectl port-forward --namespace demok8s "${POD_NAME}" "${SOLR_PORT}":8983
