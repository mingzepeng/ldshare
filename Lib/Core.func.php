<?php
if (!defined('IN')) die('access deined');
function newClass($class)
{
    static $classes = array();
    if (array_key_exists($class,$classes)) return $classes[$class];
	
    $class_path = ROOT.'/Lib/'.$class.'.class.php';
    if (!is_file($class_path)) return false;
	
	include_once $class_path;
	
    $pos = strrpos($class,'/');
    if ($pos !== false)
        $instance = substr($class,$pos+1);
    else 
        $instance = $class; 
	if(!class_exists($instance)) return false;
	
    $classes[$class] = new $instance;
    return $classes[$class];
}

// static class
function import($class,$type='class')
{
	static $classes = array();
	$class = $class.'.'.$type.'.php';
	$class_path = ROOT.'/Lib/'.$class;
	if($type !== 'inc')
	{
		if (!isset($classes[$type])) $classes[$type] = array();
		if (in_array($class,$classes[$type])) return true;
	}
	include($class_path);
	if($type !== 'inc') $classes[$type][] = $class;	
	return true;
}

function M($model=null,$type=null)
{
	static $models = array();
	if($type === 'clear')
	{
		if(isset($model)) 
		{
			if(isset($models[$model])) unset($models[$model]);
		}
		else
		{
			$models = array();
		}
		return;
	}
	if (!isset($model))
	{
		if(!isset($models[0])) $models[0] = new Model();
		return $models[0];
	}
	else 
	{
		if(!isset($models[$model]))
		{
			$modelfile = ROOT.'/'.Config::get('MODEL_DIR').'/'.$model.'Model.php';
			if(is_file($modelfile))
			{
				include_once($modelfile);
				$modelclass = $model.'Model';
				$models[$model] = new $modelclass;
			}
			else
			{
				$models[$model] = new Model($model);
			}
		}
		return isset($models[$model]) ? $models[$model] : null ;
	}
}

function U($app=null,$action=null,$param = array(),$enter=null)
{
	$params = array();
	if($app === null) $app = Controller;
    	if($action === null) $action = 'index';
	if (!empty($param))
		foreach ($param as $key=>$value)  $params[] = $key.'='.$value;
	if($enter === null)
	{
		if(defined('ENTER')) 
			$enter = ENTER;
		else
			$enter = '';
	}
	$url = $enter.'?c='.$app.'&a='.$action;
	if(!empty($params)) $url .= '&'.implode('&',$params);
	return $url;
}

function url($app=null,$action=null,$param = array(),$enter=null)
{
    echo U($app,$action,$param,$enter);   
}