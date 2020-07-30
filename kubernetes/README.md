# Demo app issues

n/a right now

# Kubernetes

Note, this should be re-done with proper helm charts and stuff.

## MicroK8s

```text
microk8s is running
addons:
dashboard: enabled
dns: enabled
ingress: enabled
metallb: enabled <@note: This is not supported on MacOS>
metrics-server: enabled
storage: enabled
```


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

## Logging
Redo logging to be 12factor compliant.
Show logs in grafana nonetheless.
php-fpm config: https://github.com/kibatic/symfony-docker/blob/master/7.3/rootfs/etc/php/7.3/fpm/pool.d/www_kibatic.conf
Symfony issue https://github.com/symfony/symfony/issues/31556
@todo: Change php/php-fpm/nginx logging so they log similarly to monolog (json with similar format mb).
http://www.inanzzz.com/index.php/post/6cn7/formatting-php-fpm-and-nginx-access-logs-as-standardised-json-string-in-docker-environment
https://medium.com/@Alibaba_Cloud/technical-best-practices-for-container-log-processing-d33e64e3e8da
https://stackoverflow.com/questions/22541333/have-nginx-access-log-and-error-log-log-to-stdout-and-stderr-of-master-process

## Best practices:
https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/

## CLI

CronJob and Job type resources use the same image as the standard Deployment. The prod-ish Deployment shouldn't have most (or any) of the CLI tools, e.g drush or composer, only the Job-type ones.

## Others
- General (Drupal)
    - HA setup for Drupal
        - move nginx to Pod instead of sidecaring it [if needed] (postponed)
    - https://github.com/wunderio/charts/blob/master/drupal/templates/drupal-deployment.yaml
    - https://www.skpr.io/  
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
