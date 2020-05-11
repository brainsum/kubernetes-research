docker build -f app/Dockerfile . -t brainsum/k8sdemo-fpm-app:1.0.0
docker build -f nginx/Dockerfile . -t brainsum/k8sdemo-fpm-nginx:1.0.0
