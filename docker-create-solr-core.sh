#!/usr/bin/env bash

source .env

docker-compose exec --user 1000 solr sh -c "make create core=${SOLR_CORE} -f /usr/local/bin/actions.mk"
