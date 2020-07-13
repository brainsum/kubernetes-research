ARG BASE_IMAGE_TAG

FROM wodby/nginx:${BASE_IMAGE_TAG}

COPY config/ /etc/nginx/

COPY --from=brainsum/k8sdemo:7.4-dev-4.15.8-3 /var/www/html /var/www/html/

ENTRYPOINT []
CMD ["sudo", "nginx"]
