<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';
// load Venne:CMS

/** @var $loader Composer\Autoload\ClassLoader */
$loader = require_once __DIR__ . '/../vendor/autoload.php';

// create and run application
$configurator = new \Venne\Config\Configurator(dirname(__DIR__) . '/app', $loader);
$configurator->enableDebugger();
$configurator->enableLoader();
$configurator->getContainer()->application->run();
