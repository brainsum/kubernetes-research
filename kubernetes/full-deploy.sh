#!/usr/bin/env bash

#alias kubectl='microk8s kubectl'

#kubectl config use-context DemoCluster
microk8s start
kubectl config use-context microk8s

kubectl apply -f namespace.yaml

helm install nginx-ingress stable/nginx-ingress \
  --namespace demok8s \
  --set controller.replicaCount=2 \
  --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
  --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux

kubectl apply -f app-balancer.yaml

kubectl apply -f ingress.yaml

kubectl apply -f secret/database-secret.yaml
kubectl apply -f secret/app-secret.yaml
kubectl apply -f secret/app-config.yaml

kubectl apply -f bitnamidb.yaml
kubectl apply -f database-backup-volume.yaml

### CACHE -----------

# @todo:
# 6.28M / unlimited, maxmemory policy: noeviction
# It is recommended to configure the maxmemory policy to e.g. volatile-lru, see Redis documentation.
helm install drupal-cache-redis bitnami/redis \
  --namespace demok8s \
  -f secret/redis-values.yaml
### ------------------
### LOGGING ----------
#
# @todo: Maybe add sidecar to app: https://hub.helm.sh/charts/fluent/fluent-bit
#
# helm repo add loki https://grafana.github.io/loki/charts
# helm upgrade --install loki-stack --namespace demok8s loki/loki-stack
# Note: promtail might not be required (it's included in the stack)
# Note: fluentbit might be a better tool (at least from an overhead standpoint)
helm install loki-stack --namespace demok8s loki/loki-stack
# @todo: WARNING: Persistence is disabled!!!
# @todo: http://loki-stack:3100 data source and log dashboard should be added via config automatically.
helm install loki-grafana --namespace demok8s stable/grafana
### -----------------
### SEARCH ----------
# helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
# wodby/solr:8-4.6.1  vs  solr=8.5.2-slim
#helm install solr incubator/solr --namespace demok8s \
#  --set image.repository=wodby/solr,image.tag=8-4.6.1,volumeClaimTemplates.storageSize=5Gi
## --
# @see: https://github.com/bloomberg/solr-operator/blob/master/docs/running-the-operator.md
kubectl apply -f https://raw.githubusercontent.com/bloomberg/solr-operator/master/example/dependencies/zk_operator.yaml
# helm repo add solr-operator https://bloomberg.github.io/solr-operator/charts
helm install solr-operator solr-operator/solr-operator \
    --namespace demok8s \
    --set watchNamespaces=true
kubectl apply -f solr-cloud.yaml
# @todo: Wait for solr pods.
bash upload-solr-core.sh
kubectl apply -f solr-collection.yaml
### -----------------
kubectl apply -f app-volume.yaml
kubectl apply -f app-deployment.yaml
kubectl apply -f drupal-cron.yaml

# @todo: Create services for the K8s dashboard and Grafana so there's no need for tunneling (on localhost only, not for prod).

##
# kubectl exec demok8s-app -n demok8s drupal -- drush si default --existing-config -y
# kubectl exec demok8s-app -n demok8s drupal -- drush cset system.site uuid 9d9dbb0a-b8bb-48ff-9c2f-5c56697c81a1 -y
##

## @note: Old stuff:
# helm template drupal-database bitnami/mariadb -n demok8s -f secret/bitnamidb-values.yaml > bitnamidb.yaml
#kubectl apply -f bitnamidb.yaml -n "${namespace}"
