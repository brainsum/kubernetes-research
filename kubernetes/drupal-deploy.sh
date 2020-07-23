#!/usr/bin/env bash

POD_NAME=$(kubectl -n demok8s get pods --selector='app=demok8s-app' -o jsonpath='{.items[:1].metadata.name}')
kubectl -n demok8s exec -it "${POD_NAME}" -c drupal -- bash -c "drush updb -y && drush cim -y && drush cr && drush cron"
