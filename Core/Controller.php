<?php
class Controller extends Core
{	
	public static $view = null;

	public static $log_data = array();
	
	public function display($file='',$type='put')
	{
		if (self::$view instanceof View) return self::$view->display($file,$type);
	}
	
	public function assign($key=null,$value=null)
	{
		if (self::$view instanceof View) self::$view->assign($key,$value);
	}

	public function assignPage($page=null,$value=null)
	{
		if (self::$view instanceof View) self::$view->setPage($page,$value);
	}

	public function setViewConfig($config=null,$value=null)
	{
		if (self::$view instanceof View) self::$view->setConfig($config,$value);
	}
	
	public function setModule($module)
	{
		if (self::$view instanceof View) self::$view->setModule($module);
	}
	
	public function to($controller=null,$action='index',$params=array(),$enter=null)
	{
		if($controller === null)
		{
			$called_class = get_called_class();
			$controller = substr($called_class, 0 ,strrpos($called_class, "Controller")) ;
		} 
		$url = U($controller,$action,$params,$enter);
		header("Location:{$url}");
	}

	public function log($var,$value=null)
	{
		if(is_array($var)) 
			Controller::$log_data = array_merge(Controller::$log_data,$var);
		elseif($value === null)
		{
			Controller::$log_data[] = $var;
		}
		else
		{
			Controller::$log_data[$var] = $value;
		}
	}
}