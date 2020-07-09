<?php

/**
 * @file
 * This file is included very early. See autoload.files in composer.json.
 *
 * @see: https://getcomposer.org/doc/04-schema.md#files
 */

use Symfony\Component\Dotenv\Dotenv;
use Symfony\Component\Dotenv\Exception\PathException;

$dotenv = new Dotenv();
try {
  $dotenv->load(__DIR__ . '/.env');
}
catch (PathException $e) {
  // Do nothing. Production environments rarely use .env files.
}
