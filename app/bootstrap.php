<?php

/**
 * Venne:CMS bootstrap file.
 */

use Nette\Application\Routers\Route;

// Load Nette Framework and Venne:CMS
$params['rootDir'] = __DIR__ . '/..';
$params['tempDir'] = $params['rootDir'] . '/temp';
$params['libsDir'] = $params['rootDir'] . '/libs';
$params['venneDir'] = $params['libsDir'] . '/Venne';
require $params['venneDir'] . '/loader.php';

// Setup router
$router = $container->router;
$router[] = new Route('<presenter>/<action>[/<id>]', 'Homepage:default');

// Configure and run the application!
$application->run();
