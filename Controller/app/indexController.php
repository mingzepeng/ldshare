<?php
class indexController extends Controller
{
	public function indexAction()
	{
		$category = range('A', 'Z');
		$category[] = '0-9';
		$m = M("document");

		$m->order('created_at desc');
		if(isset($_GET['type_id']) && !empty($_GET['type_id']))
		{			
			$type_id = (int)$_GET['type_id'];
			$this->assign('type_id',$type_id);
			$m->where("type_id='{$type_id}'");
		} 
		$list = $m->find();

		$this->assign('list',$list);
		$this->assign('category',$category);
		$this->assignPage("content","main");
		$this->display("index");
	}
}