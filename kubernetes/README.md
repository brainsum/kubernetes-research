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


- `helm repo add stable https://kubernetes-charts.storage.googleapis.com/`
- `helm install nginx-ingress stable/nginx-ingress \
    --namespace viaroadsafety \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux`
