<?php

/**
 * Venne:CMS bootstrap file.
 */

$parameters['rootDir'] = realpath(__DIR__ . '/..');
$parameters['tempDir'] = $parameters['rootDir'] . '/temp';
$parameters['libsDir'] = $parameters['rootDir'] . '/libs';
$parameters['venneDir'] = $parameters['libsDir'] . '/Venne';
$parameters['appDir'] = $parameters['rootDir'] . '/app';
$parameters['wwwDir'] = $parameters['rootDir'] . '/www';
$parameters['configDir'] = $parameters['appDir'] . '/config';

require __DIR__ . '/../libs/Venne/loader.php';
