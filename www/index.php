<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';
// load Venne:CMS
require_once __DIR__ . '/../vendor/venne/cms/Venne/loader.php';

// load settings
$settings = require_once __DIR__ . '/../app/config/settings.php';

// create and run application
$configurator = new \Venne\Config\Configurator($settings);
$configurator->enableDebugger();
$configurator->enableLoader();
$configurator->getContainer()->application->run();