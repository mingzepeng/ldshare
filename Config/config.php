<?php

//全局配置文件

return array(

	//开启debug
	'DEBUG'=>true,

	'DEFAULT_TIME_ZONE'=>'Asia/Shanghai',

	'HOST'=>'http://localhost/ldshare',

	'APP_NAME'=>'书架晒晒月光',


	//cookie设置
	'COOKIE_PRE'=>'pq_',

	'COOKIE_DOMAIN'=>'',

	'COOKIE_PATH'=>'/',

	//确定目录
	'APP_DIR'=>'Controller',

	'MODEL_DIR'=>'Model',

	'VIEW_DIR'=>'View',

	//确定模块名称
	'DEFAULT_MODULE'=>'app',

	'DEFAULT_CONTROLLER'=> 'index',
	


	//数据库连接
	'DB' => array(
		'MAIN'=> array(
			
			'type'=>'mysql',

			'host'=>'localhost',

			'user'=>'root',

			'password'=>'',

			'charset'=>'utf8',

			'db_name'=>'ldshare',

			'table_pre'=>'jh_',

			'pconnect'=>0,
		)
	)
);
