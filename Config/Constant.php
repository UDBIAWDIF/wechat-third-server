<?php

namespace CommonConfig;

const TEST_ENV = true;
const APP_DEBUG = true;
const URL_MODEL = 0;
const URL_CASE_INSENSITIVE = false;

const DB_HOST = '127.0.0.1';
const DB_NAME = 'wechat-tp';
const DB_USER = 'UID';
const DB_PWD = '1';
const DB_PORT = 3306;
const DB_PREFIX = 'wts_';

const REDIS_HOST = '127.0.0.1';
const REDIS_PORT = 6379;
const REDIS_AUTH = '';

const MC_HOST = '127.0.0.1';
const MC_PORT = 11211;
const MC_USER = '';
const MC_PASSWORD = '';

define('UID_RUNTIME_PATH', dirname(__DIR__) . '/Runtime/');
define('UID_LOG_PATH', dirname(__DIR__) . '/Runtime/logs/');
define('UID_CACHE_PATH', dirname(__DIR__) . '/Runtime/cache/');
