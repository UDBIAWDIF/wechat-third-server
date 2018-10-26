<?php

include '../bootstrap.php';

define('APP_DEBUG', \CommonConfig\APP_DEBUG);

// 去除生成链接中的 index.php
// define('__APP__', '');

define('BIND_MODULE', 'Home');
define('RUNTIME_PATH', UID_RUNTIME_PATH . BIND_MODULE .'/');
require FRAMEWORK_PATH . 'ThinkPHP.php';
