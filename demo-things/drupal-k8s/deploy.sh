namespace=drupalk8s

kubectl create namespace "${namespace}"
kubectl apply -f app-balancer.yaml -n "${namespace}"
# helm template drupal-database bitnami/mariadb -n drupalk8s -f bitnamidb-values.yaml > bitnamidb.yaml
kubectl apply -f database-secret.yaml -n "${namespace}"
kubectl apply -f bitnamidb.yaml -n "${namespace}"
kubectl apply -f app-secret.yaml -n "${namespace}"
kubectl apply -f app.yaml -n "${namespace}"


# @todo: drush si damo --existing-config -y
# @todo: drush cset system.site uuid 38f757ea-46c9-483d-bfa6-7d9f3238ed1f -y
#
# kubectl exec demok8s-app -n drupalk8s drupal -- rm web/sites/docker.settings.php
# kubectl exec demok8s-app -n drupalk8s drupal -- drush si damo --existing-config -y
# kubectl exec demok8s-app -n drupalk8s drupal -- drush cset system.site uuid 38f757ea-46c9-483d-bfa6-7d9f3238ed1f -y
