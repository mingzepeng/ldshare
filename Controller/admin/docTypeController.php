<?php
class docTypeController extends Controller
{
	public function indexAction()
	{
		//echo "string";
		$m = M('docType');
		$this->assign('data',$m->find());
		$this->display("doc_type_list");
	}

	public function addAction()
	{
		//echo "string";
		$this->display("doc_type_add");
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
		$this->display('doc_type_edit');
	}

	public function updateAction()
	{
		$m = M('docType');
		$m->create();
		$m->update((int)$_POST['id']);	
		$this->indexAction();
	}

	public function deleteAction()
	{
		$m = M('docType');
		$m->delete((int)$_GET['id']);
		$this->indexAction();
	}


}