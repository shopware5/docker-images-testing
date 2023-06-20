<?php
return [
    'db' => [
        'username' => '%db.user%',
        'password' => '%db.password%',
        'dbname' => '%db.database%',
        'host' => '%db.host%',
        'port' => '%db.port%'
    ],

    'csrfProtection' => [
        'frontend' => false,
        'backend' => false,
    ],

    'logger' => [
        'level' => 100,
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

    'template' => [
        'forceCompile' => true,
    ],

    'cache' => [
        'backend' => 'Black-Hole',
    ],
];

