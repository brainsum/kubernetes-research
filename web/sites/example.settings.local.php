<?php

/**
 * @file
 * Local settings.
 */

$settings['container_yamls'][] = __DIR__ . '/services.monolog.yml';
$settings['container_yamls'][] = __DIR__ . '/services.local.yml';

if (file_exists(__DIR__ . '/settings.redis.php')) {
  include_once __DIR__ . '/settings.redis.php';
}

if (file_exists(__DIR__ . '/settings.solr.php')) {
  include_once __DIR__ . '/settings.solr.php';
}

$config['system.logging']['error_level'] = 'verbose';

/**
 * Disable CSS and JS aggregation.
 */
$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

$settings['cache_prefix'] = 'k8sdemo_';
//$settings['cache']['default'] = 'cache.backend.null';
//$settings['cache']['bins']['render'] = 'cache.backend.null';
//$settings['cache']['bins']['discovery_migration'] = 'cache.backend.null';
//$settings['cache']['bins']['page'] = 'cache.backend.null';
//$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
//$settings['extension_discovery_scan_tests'] = TRUE;
//$settings['rebuild_access'] = TRUE;
//$settings['skip_permissions_hardening'] = TRUE;
$settings['config_exclude_modules'] = [
  'devel',
  'devel_php',
  'devel_entity_updates',
  'dblog',
];

$settings['trusted_host_patterns'] = [
  '^' . str_replace('.', '\.', getenv('DRUPAL_BASE_URL')) . '$',
];
