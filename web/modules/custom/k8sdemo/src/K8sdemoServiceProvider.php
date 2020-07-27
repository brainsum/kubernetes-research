<?php

namespace Drupal\k8sdemo;

use Drupal\Core\DependencyInjection\ContainerBuilder;
use Drupal\Core\DependencyInjection\ServiceModifierInterface;
use function getenv;

/**
 * Class K8sdemoServiceProvider.
 *
 * @package Drupal\k8sdemo
 */
class K8sdemoServiceProvider implements ServiceModifierInterface {

  /**
   * {@inheritDoc}
   */
  public function alter(ContainerBuilder $container) {
    $definition = $container->getDefinition('monolog.handler.loki');
    $config = $definition->getArgument(0);
    $config['entrypoint'] = getenv('LOGGING_URI');
    $definition->setArgument(0, $config);
  }

}
