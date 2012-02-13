<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';

// load Venne:CMS
require_once __DIR__ . '/../libs/Nette/loader.php';
require_once __DIR__ . '/../libs/Venne/loader.php';

$configurator = new \Venne\Config\Configurator();
$configurator->enableDebugger();
$configurator->enableLoader();
$container = $configurator->getContainer();
$container->application->run();