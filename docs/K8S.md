# Setup

## Steps 

- Azure portal: Set up a cluster via UI.
- Install azure cli: `curl -L https://aka.ms/InstallAzureCli | bash`
- Log in: `az login`
- Install kubectl: `az aks install-cli`
- Authorize kubectl: `az aks get-credentials -g kube-demo -n demo-cluster`
- Verify: `kubectl get nodes`
- Helm:
    - `curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get-helm-3 > get_helm.sh`
    - `chmod 700 get_helm.sh`
    - `./get_helm.sh`
- `helm repo add stable https://kubernetes-charts.storage.googleapis.com/`    
- `helm repo add bitnami https://charts.bitnami.com/bitnami`    
    - Note: The archived azure repo refers to this, see <https://github.com/Azure/helm-charts>
- Kompose
    - `curl -L https://github.com/kubernetes/kompose/releases/download/v1.21.0/kompose-linux-amd64 -o kompose`


## Sources

- <https://docs.bitnami.com/azure/get-started-aks/>
- <https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-prepare-app>
- <https://medium.com/containerum/how-to-easily-deploy-a-drupal-instance-on-kubernetes-1c091f45dcbb>
- <https://www.jeffgeerling.com/blog/2019/running-drupal-kubernetes-docker-production>


## @todos

### Current

- https://www.jeffgeerling.com/blog/2019/running-drupal-kubernetes-docker-production


### Additional
    
- Add proper dockerfile
- Update .github/workflows/deploytoAksCluster.yml with dockerfile, context, etc.
- Check these:
    - https://github.com/kubernetes/kompose
    - https://www.digitalocean.com/community/tutorials/how-to-migrate-a-docker-compose-workflow-to-kubernetes
    - https://github.com/drupalwxt/helm-drupal/tree/master/drupal
    - https://docs.microsoft.com/en-us/azure/aks/kubernetes-helm
    - https://github.com/geerlingguy/drupal-for-kubernetes
    - https://help.github.com/en/actions/building-actions/dockerfile-support-for-github-actions
    - https://github.com/abhirockzz/kubernetes-in-a-nutshell
    - https://matthewpalmer.net/kubernetes-app-developer/articles/php-fpm-nginx-kubernetes.html
    - https://dev.to/itnext/tutorial-how-to-use-kubernetes-secrets-for-storing-sensitive-config-data-3dl5
    - https://dev.to/itnext/hands-on-guide-configure-your-kubernetes-apps-using-the-configmap-object-44gj
- Management: https://github.com/sylus/drupal-operator
- Cron: https://www.jeffgeerling.com/blog/2018/running-drupal-cron-jobs-kubernetes


### Keep in mind
- File storage (e.g with s3fs; using NFS (e.g. EFS in AWS) or Rook to manage Ceph filesystems)

