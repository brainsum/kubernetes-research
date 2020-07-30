<?php

/**
 * @file
 * Local settings.
 */

if (file_exists(__DIR__ . '/settings.redis.php')) {
  include_once __DIR__ . '/settings.redis.php';
}

if (file_exists(__DIR__ . '/settings.solr.php')) {
  include_once __DIR__ . '/settings.solr.php';
}

$settings['cache_prefix'] = 'k8sdemo_';
$settings['container_yamls'][] = __DIR__ . '/services.monolog.yml';
