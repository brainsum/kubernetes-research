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

$config['backend_config']['connector'] = 'solr_cloud';
$config['search_api.server.solr']['backend_config']['connector_config']['checkpoints_collection'] = '';
$config['search_api.server.solr']['backend_config']['connector_config']['stats_cache'] = 'org.apache.solr.search.stats.LRUStatsCache';

$settings['cache_prefix'] = 'k8sdemo_';
$settings['container_yamls'][] = __DIR__ . '/services.monolog.yml';
