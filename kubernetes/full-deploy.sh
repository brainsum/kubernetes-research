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

kubectl apply -f ingress.yaml

kubectl apply -f secret/database-secret.yaml
kubectl apply -f secret/app-secret.yaml

kubectl apply -f bitnamidb.yaml

helm install drupal-cache-redis bitnami/redis \
    --namespace demok8s \
    -f secret/redis-values.yaml

#
# @todo: Maybe add sidecar to app: https://hub.helm.sh/charts/fluent/fluent-bit
#
# helm repo add loki https://grafana.github.io/loki/charts
#helm upgrade --install loki-stack --namespace demok8s loki/loki-stack
helm install loki-stack --namespace demok8s loki/loki-stack

#helm install --namespace demok8s mongodb stable/mongodb-replicaset
## helm repo add elastic https://helm.elastic.co
#helm install --namespace demok8s elasticsearch elastic/elasticsearch
#helm install --namespace demok8s graylog stable/graylog \
#  --set tags.install-mongodb=false \
#  --set tags.install-elasticsearch=false \
#  --set graylog.mongodb.uri=mongodb://mongodb-mongodb-replicaset-0.mongodb-mongodb-replicaset.demok8s.svc.cluster.local:27017/graylog?replicaSet=rs0 \
#  --set graylog.elasticsearch.hosts=http://elasticsearch-client.demok8s.svc.cluster.local:9200

kubectl apply -f app-volume.yaml
kubectl apply -f app-deployment.yaml
kubectl apply -f app-balancer.yaml


##
# kubectl exec demok8s-app -n demok8s drupal -- drush si default --existing-config -y
# kubectl exec demok8s-app -n demok8s drupal -- drush cset system.site uuid 9d9dbb0a-b8bb-48ff-9c2f-5c56697c81a1 -y
##

## @note: Old stuff:
# helm template drupal-database bitnami/mariadb -n demok8s -f secret/bitnamidb-values.yaml > bitnamidb.yaml
#kubectl apply -f bitnamidb.yaml -n "${namespace}"
