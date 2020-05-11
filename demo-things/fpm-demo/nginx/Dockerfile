FROM nginx:1.17.10

COPY nginx/site.conf /etc/nginx/conf.d/default.conf
COPY --from=brainsum/k8sdemo-fpm-app:1.0.0 --chown=www-data /var/www/html /var/www/html/
