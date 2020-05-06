<?php

// @codingStandardsIgnoreFile

// Config sync directory.
$config_directories['sync'] = '../config/sync';

// Hash salt.
$settings['hash_salt'] = getenv('DRUPAL_HASH_SALT');

// Disallow access to update.php by anonymous users.
$settings['update_free_access'] = FALSE;

// Other helpful settings.
/** @var string $app_root */
/** @var string $site_path */
$settings['container_yamls'][] = $app_root . '/' . $site_path . '/services.yml';

// Database connection.
$databases = [];
$databases['default']['default'] = [
  'database' => getenv('DRUPAL_DATABASE_NAME'),
  'username' => getenv('DRUPAL_DATABASE_USERNAME'),
  'password' => getenv('DRUPAL_DATABASE_PASSWORD'),
  'prefix' => '',
  'host' => getenv('DRUPAL_DATABASE_HOST'),
  'port' => getenv('DRUPAL_DATABASE_PORT'),
  'namespace' => 'Drupal\Core\Database\Driver\mysql',
  'driver' => 'mysql',
];

$settings['file_scan_ignore_directories'] = [
  'node_modules',
  'bower_components',
];

$settings['entity_update_batch_size'] = 50;
$settings['entity_update_backup'] = TRUE;

$settings['config_sync_directory'] = '../config/sync';
$settings['file_public_path'] = 'sites/default/files';

if (file_exists(__DIR__ . '/../damo.settings.php')) {
  include_once __DIR__ . '/../damo.settings.php';
}

if (file_exists(__DIR__ . '/../development.settings.php')) {
  include_once __DIR__ . '/../development.settings.php';
}

if (file_exists(__DIR__ . '/../local.settings.php')) {
  include_once __DIR__ . '/../local.settings.php';
}
