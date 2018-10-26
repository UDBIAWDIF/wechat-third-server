<?php

// $dbConfig = array(
	// 'DB_TYPE'	=> !empty($_SERVER['DB_TYPE'])
					// ? $_SERVER['DB_TYPE']	: 'mysqli',
	// 'DB_HOST'	=> !empty($_SERVER['DB_HOST'])
					// ? $_SERVER['DB_HOST']	: '127.0.0.1',
	// 'DB_NAME'	=> !empty($_SERVER['DB_NAME'])
					// ? $_SERVER['DB_NAME']	: 'wechat-tp',
	// 'DB_USER'	=> !empty($_SERVER['DB_USER'])
					// ? $_SERVER['DB_USER']	: 'UID',
	// 'DB_PWD'	=> !empty($_SERVER['DB_PWD'])
					// ? $_SERVER['DB_PWD']	: '1',
	// 'DB_PORT'	=> !empty($_SERVER['DB_PORT'])
					// ? $_SERVER['DB_PORT']	: '3306',
	// 'DB_PREFIX'	=> !empty($_SERVER['DB_PREFIX'])
					// ? $_SERVER['DB_PREFIX']	: 'wts_',
	// 'DB_PARAMS'	=> array(
		// \PDO::ATTR_CASE => \PDO::CASE_NATURAL,  // 区分大小写
	// ),
// );

$dbConfig = array(
	'DB_HOST'	=> \CommonConfig\DB_HOST,
	'DB_NAME'	=> \CommonConfig\DB_NAME,
	'DB_USER'	=> \CommonConfig\DB_USER,
	'DB_PWD'	=> \CommonConfig\DB_PWD,
	'DB_PORT'	=> \CommonConfig\DB_PORT,
	'DB_PREFIX'	=> \CommonConfig\DB_PREFIX,
	'DB_TYPE'	=> !empty($_SERVER['DB_TYPE'])
					? $_SERVER['DB_TYPE']	: 'mysqli',
	'DB_PARAMS'	=> array(
		\PDO::ATTR_CASE => \PDO::CASE_NATURAL,  // 区分大小写
	),
);

return $dbConfig;
