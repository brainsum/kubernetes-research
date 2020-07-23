# Kubernetes

Note, this should be re-done with proper helm charts and stuff.

## Values

- Secret values need to be base64 encoded. You can use this: `echo -n '<value>' | openssl base64`
- Generate values with something like this: `LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | head -c20`
    - Note: Replace 20 with the length you need.

## Note:

We absolutely should secure secrets.

- https://victorops.com/blog/securely-keeping-kubernetes-secrets-in-git


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

# Sources

## TODOs

- https://github.com/wunderio/charts/blob/master/drupal/templates/drupal-deployment.yaml
