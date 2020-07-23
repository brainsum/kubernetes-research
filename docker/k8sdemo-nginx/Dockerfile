ARG BASE_IMAGE
ARG SOURCE_CODE_IMAGE

# Args don't seem to be supported in `COPY --from` so add the source code image as a build stage.
FROM ${SOURCE_CODE_IMAGE} as source

FROM ${BASE_IMAGE}

ENV \
    APP_ROOT="/var/www/html"

COPY config/ /etc/nginx/

# @todo: Only copy webroot.
COPY --from=source /var/www/html /var/www/html/

ENTRYPOINT []
CMD ["sudo", "nginx"]
