<?php

define('ROOT_PATH', __DIR__ . '/');
define('BASE_PATH', ROOT_PATH);
define('ENTRY_PATH', ROOT_PATH . 'Public/');	// 入口文件所在目录, 用来计算静态文件路径
define('VENDOR_PATH', ROOT_PATH . 'vendor/');
// include VENDOR_PATH . 'autoload.php';

$constantFile = ROOT_PATH . 'Config/Constant.php';
if(!is_file($constantFile)) {
	header('Content-Type: text/html; charset=utf-8');
	die("未找到配置文件{$constantFile}, 请从配置示例文件复制一份, 然后修改成当前配置");
}
include $constantFile;

define('APP_PATH', ROOT_PATH . 'Application/');
// define('RUNTIME_PATH', RB_RUNTIME_PATH);
// define('LOG_PATH', RB_LOG_PATH);
define('FRAMEWORK_PATH', ROOT_PATH . 'ThinkPHP/');
