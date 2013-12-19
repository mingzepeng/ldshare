<?php
include 'init.php';

define('MODULE','admin');

define('CONTROLLER',(isset($_GET['c']) && $_GET['c'] !=='')? trim($_GET['c']) : Config::get('DEFAULT_CONTROLLER'));

define('ACTION',(isset($_GET['a']) && $_GET['a'] !=='')? trim($_GET['a']) : 'index');

define('ENTER', 'admin');

App::run(MODULE,CONTROLLER,ACTION);