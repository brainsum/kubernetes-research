<?php

$settings['container_yamls'][] = __DIR__ . '/services.redis.yml';

$settings['redis.connection']['interface'] = 'Predis';
$settings['redis.connection']['host'] = getenv('REDIS_HOST');
$settings['redis.connection']['password'] = getenv('REDIS_PASSWORD');
$settings['cache']['default'] = 'cache.backend.redis';
$settings['cache']['bins']['render'] = 'cache.backend.redis';
$settings['cache']['bins']['discovery_migration'] = 'cache.backend.redis';
$settings['cache']['bins']['page'] = 'cache.backend.redis';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.redis';
# Or if you want to use reliable queue implementation.
$settings['queue_default'] = 'queue.redis_reliable';
# Or if you want to use reliable queue implementation.
$settings['queue_service_aggregator_feeds'] = 'queue.redis_reliable';
$settings['redis_compress_level'] = 1;
$settings['redis_compress_length'] = 100;
