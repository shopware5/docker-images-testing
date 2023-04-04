<?php
return [
    'db' => [
        'username' => getenv('DB_USER'),
        'password' => getenv('DB_PASSWORD'),
        'dbname' => getenv('DB_NAME'),
        'host' => getenv('DB_HOST'),
        'port' => getenv('DB_PORT'),
    ],

    'csrfProtection' => [
        'frontend' => false,
        'backend' => false,
    ],

    'logger' => [
        'level' => \Shopware\Components\Logger::DEBUG,
    ],

    'front' => [
        'noErrorHandler' => true,
        'throwExceptions' => true,
        'disableOutputBuffering' => true,
        'showException' => true,
    ],

    'phpsettings' => [
        'display_errors' => 1,
    ],

    'errorHandler' => [
        'throwOnRecoverableError' => true,
        'ignoredExceptionClasses' => [],
    ],

    'template' => [
        'forceCompile' => true,
    ],

    'cache' => [
        'backend' => 'Black-Hole',
    ],
];

