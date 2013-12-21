<?php
class indexController extends Controller
{
	public function indexAction()
	{
		$category = range('A', 'Z');
		$category[] = '0-9';
		$m = M("document");
		$list = $m->order('CONVERT( name USING gbk )')->find();
		//var_dump(mysql_error());
		$this->assign('list',$list);
		$this->assign('category',$category);
		$this->display("index");
	}
}