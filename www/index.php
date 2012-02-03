<?php

// uncomment this line if you must temporarily take down your site for maintenance
// require '.maintenance.php';

// load Venne:CMS
require_once __DIR__ . '/../libs/Venne/loader.php';
$venne = new \Venne\Loader(__DIR__ . "/../");
$venne->run();