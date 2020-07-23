ARG BASE_IMAGE

FROM $BASE_IMAGE

ENV \
    USER_NAME="wodby"

USER ${USER_NAME}

COPY --chown=${USER_NAME} composer.json composer.lock ./

RUN composer global require hirak/prestissimo && composer install -o --no-suggest

COPY --chown=${USER_NAME} . .

# @todo: Create a prod image.
# @todo: web/sites/settings.local.php needs to be added dynamically
