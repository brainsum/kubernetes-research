#!/usr/bin/env bash

# @todo: Wait for pods to be available.

# @todo: Fix.
SOLR_POD=$(kubectl get pods -l "solr-cloud=solr" -o jsonpath="{.items[0].metadata.name}")

# @todo: Fix liveness/readiness probe with auth, it returns 401 with it.
SEC_FILE="$(realpath ../docker/drupal-solr/empty-security.json)"
CONF_SET_DIR="$(realpath ../docker/drupal-solr/solr_8.x_config)"

echo "Uploading security.json.."
kubectl cp "${SEC_FILE}" "${SOLR_POD}:/tmp/security.json" || exit 1
echo "Move security.json to zk."
kubectl exec -it "pod/${SOLR_POD}" -- solr zk cp file:/tmp/security.json zk:/security.json || exit 1

echo "Uploading configset.."
kubectl cp "${CONF_SET_DIR}" "${SOLR_POD}:/tmp/drupal-configset" || exit 1
echo "Move configset to zk."
kubectl exec -it "pod/${SOLR_POD}" -- solr zk upconfig -n drupal -d "/tmp/drupal-configset" || exit 1
