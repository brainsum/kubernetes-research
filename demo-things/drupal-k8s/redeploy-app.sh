kubectl delete -f app.yaml -n drupalk8s --wait
kubectl apply -f app.yaml -n drupalk8s --wait

#kubectl exec demok8s-app -n drupalk8s drupal -- rm web/sites/docker.settings.php
#kubectl exec demok8s-app -n drupalk8s drupal -- drush si damo --existing-config -y


### Current User name: admin  User password: B7TC5vktG5