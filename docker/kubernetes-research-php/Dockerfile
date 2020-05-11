ARG BASE_IMAGE_TAG

FROM brainsum/damo-php:$BASE_IMAGE_TAG

ENV \
    USER_NAME="wodby"

USER ${USER_NAME}

COPY --chown=${USER_NAME} assets/* assets/
COPY --chown=${USER_NAME} composer.json composer.lock ./

RUN composer install -o --no-suggest

COPY --chown=${USER_NAME} . .

# @todo: Create a prod image.
# @todo: drush/drush.yml needs to be added dynamically
# @todo: web/sites/settings.local.php needs to be added dynamically
