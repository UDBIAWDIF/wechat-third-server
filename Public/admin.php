<?php

include '../bootstrap.php';

define('APP_DEBUG', \CommonConfig\APP_DEBUG);

// 去除生成链接中的 admin.php
// define('__APP__', '/admin');

define('BIND_MODULE', 'Admin');
define('RUNTIME_PATH', UID_RUNTIME_PATH . BIND_MODULE .'/');
require FRAMEWORK_PATH . 'ThinkPHP.php';
