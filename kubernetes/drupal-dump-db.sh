#!/usr/bin/env bash

kubectl -n demok8s delete job drupal-database-dump
kubectl -n demok8s apply -f drupal-database-dump.yaml
