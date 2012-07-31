<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';
// load Venne:CMS
require_once __DIR__ . '/../vendor/autoload.php';

\Nette\Diagnostics\Debugger::enable(\Nette\Diagnostics\Debugger::DEVELOPMENT);

// create default configuration
foreach (array("settings.php", "config.neon", 'modules.neon') as $config) {
	if (!file_exists(__DIR__ . '/../app/config/' . $config)) {
		copy(__DIR__ . '/../app/config/' . $config . '.orig', __DIR__ . '/../app/config/' . $config);
	}
}

// load settings
$settings = require __DIR__ . '/../app/config/settings.php';

// create and run application
$configurator = new \Venne\Config\Configurator($settings);
$configurator->enableDebugger();
$configurator->enableLoader();
$configurator->getContainer()->application->run();