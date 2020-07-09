#!/usr/bin/env bash

namespace=drupalk8s

#kubectl delete -f app.yaml -n "${namespace}"
kubectl delete -f app-secret.yaml -n "${namespace}"
kubectl delete -f bitnamidb.yaml -n "${namespace}"
kubectl delete -f database-secret.yaml -n "${namespace}"
kubectl delete -f app-balancer.yaml -n "${namespace}"
kubectl delete namespace "${namespace}"
