<?php

include '../bootstrap.php';

define('APP_DEBUG', \CommonConfig\APP_DEBUG);

// 去除生成链接中的 index.php
// define('__APP__', '');

// 定义应用模式
define('APP_MODE', 'api');
define('BIND_MODULE', 'Wechat');
define('RUNTIME_PATH', UID_RUNTIME_PATH . BIND_MODULE .'/');
require FRAMEWORK_PATH . 'ThinkPHP.php';
