<?php

/**
 * @file
 * Local settings.
 */

if (file_exists(__DIR__ . '/settings.redis.php')) {
  include_once __DIR__ . '/settings.redis.php';
}

//$settings['container_yamls'][] = __DIR__ . '/services.monolog.yml';
//$settings['container_yamls'][] = __DIR__ . '/services.local.yml';
