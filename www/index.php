<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';
// load Venne:CMS
require_once __DIR__ . '/../vendor/autoload.php';

// create and run application
$configurator = new \Venne\Config\Configurator(dirname(__DIR__));
$configurator->enableDebugger();
$configurator->enableLoader();
$configurator->getContainer()->application->run();
