<?php

/**
 * @file
 * Local settings.
 */

use Drupal\Component\Assertion\Handle;

$settings['container_yamls'][] = __DIR__ . '/services.monolog.yml';
$settings['container_yamls'][] = __DIR__ . '/services.local.yml';

$settings['config_exclude_modules'] = ['devel'];

assert_options(ASSERT_ACTIVE, TRUE);
Handle::register();

$config['system.logging']['error_level'] = 'verbose';

$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

$settings['cache']['bins']['render'] = 'cache.backend.null';
$settings['cache']['bins']['discovery_migration'] = 'cache.backend.memory';
$settings['cache']['bins']['page'] = 'cache.backend.null';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
$settings['extension_discovery_scan_tests'] = TRUE;
$settings['rebuild_access'] = TRUE;
$settings['skip_permissions_hardening'] = TRUE;
