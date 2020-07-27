# Kubernetes

Note, this should be re-done with proper helm charts and stuff.

## Values

- Secret values need to be base64 encoded. You can use this: `echo -n '<value>' | openssl base64`
- Generate values with something like this: `LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | head -c20`
    - Note: Replace 20 with the length you need.

## Note:

We absolutely should secure secrets.


## Ingress setup

### Nginx
- `helm repo add stable https://kubernetes-charts.storage.googleapis.com/`
- `helm install nginx-ingress stable/nginx-ingress \
    --namespace viaroadsafety \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux`

### Azure App Gateway

@note: Incomplete.

Source: <https://docs.microsoft.com/en-us/azure/developer/terraform/create-k8s-cluster-with-aks-applicationgateway-ingress#install-helm>

- create an app gateway (cli or ui)
    - vnet, public ID, all the good stuff needs to be created, too
- `az ad sp create-for-rbac --sdk-auth | base64 -w0`
    - @todo: getting 403, pods not visible to this?
- `helm repo add application-gateway-kubernetes-ingress https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/`
- `wget https://raw.githubusercontent.com/Azure/application-gateway-kubernetes-ingress/master/docs/examples/sample-helm-config.yaml -O azure-appgateway-config.yaml`
- edit the file
- `helm install -n demok8s -f azure-appgateway-config.yaml application-gateway-kubernetes-ingress/ingress-azure`

# TODOs

- General (Drupal)
    - HA setup for Drupal
        - move nginx to Pod instead of sidecaring it [if needed] (postponed)
    - https://github.com/wunderio/charts/blob/master/drupal/templates/drupal-deployment.yaml
    - https://www.skpr.io/
    - Cron
        - https://kubernetes.io/docs/concepts/workloads/controllers/job/
        - https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/
        - build a cli-only container for this       
- General (K8s)
   - https://victorops.com/blog/securely-keeping-kubernetes-secrets-in-git          
- HTTPS/TLS
    - https://runnable.com/blog/how-to-use-lets-encrypt-on-kubernetes
    - https://itnext.io/automated-tls-with-cert-manager-and-letsencrypt-for-kubernetes-7daaa5e0cae4
    - https://github.com/jetstack/cert-manager
    - https://knative.dev/docs/serving/using-a-tls-cert/
    - https://docs.bitnami.com/tutorials/secure-kubernetes-services-with-ingress-tls-letsencrypt
    - https://kubernetes.github.io/ingress-nginx/examples/tls-termination/
Other
    - Openshift
    - kops
    - container registry
Vendor-specific:
    - Elasticache
    - Azure AppGateway
    
# Misc
- https://www.youtube.com/watch?v=2R-OFmCOp34    
- asd
    - https://github.com/DrupalStand/drupal-dev-docker
    - docksal
    ....