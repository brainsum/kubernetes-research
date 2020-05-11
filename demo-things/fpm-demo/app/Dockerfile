FROM php:7.4.5-fpm

ENV \
    # General
    USER_NAME="php" \
    WEB_USER_NAME="www-data" \
    APP_ROOT="/var/www/html" \
    APP_NAME="app" \
    ENVIRONMENT_NAME="development"

WORKDIR "${APP_ROOT}"

# www-data uid/gid 33.
RUN groupadd --gid 1000 "${USER_NAME}" \
  && useradd --uid 1000 --gid "${USER_NAME}" --shell /bin/bash --create-home "${USER_NAME}" \
  && usermod -aG "${WEB_USER_NAME}" "${USER_NAME}" \
  # Fix WEB_USER_NAME user home folder permissions.
  && chown "${WEB_USER_NAME}:${WEB_USER_NAME}" "/var/www/" \
  && chown "${USER_NAME}:${USER_NAME}" "${APP_ROOT}"

COPY index.php ./
