<?php
class docTypeController extends Controller
{
	public function indexAction()
	{
		//echo "string";
		$m = M('docType');
		$this->assign('data',$m->find());
		$this->assignPage('main','doc_type_list');
		$this->display();
	}

	public function addAction()
	{
		$this->assignPage('main','doc_type_add');
		$this->display();
	}
	
	public function insertAction()
	{
		$m = M('docType');
		$m->create();
		$result = $m->insert();
		$this->to(null,'index');
	}

	public function editAction()
	{
		$m = M("docType");
		$data = $m->findone((int)$_GET['id']);
		$this->assign('data',$data);
		$this->assignPage('main','doc_type_edit');
		$this->display();
	}

	public function updateAction()
	{
		$m = M('docType');
		$m->create();
		$m->update((int)$_POST['id']);	
		$this->to(null,'index');
	}

	public function deleteAction()
	{
		$m = M('docType');
		$m->delete((int)$_GET['id']);
		$this->to(null,'index');
	}


}