#!/usr/bin/env bash

kubectl -n demok8s delete job drupal-deploy
kubectl -n demok8s apply -f drupal-deployment-job.yaml
