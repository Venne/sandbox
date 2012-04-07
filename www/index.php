<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';

// load Venne:CMS
require_once __DIR__ . '/../vendor/nette/nette/Nette/loader.php';
require_once __DIR__ . '/../vendor/venne/cms/Venne/loader.php';

\Nette\Diagnostics\Debugger::enable(\Nette\Diagnostics\Debugger::DEVELOPMENT);

$configurator = new \Venne\Config\Configurator();
$configurator->enableDebugger();
$configurator->enableLoader();
$container = $configurator->getContainer();
$container->application->run();