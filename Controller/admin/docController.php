<?php
class docController extends Controller
{
	public function indexAction()
	{
		$m = M("document");
		$m2 = M('docType');
		$list_type = $m2->find();
		$types = array();
		foreach ($list_type as  $value) {
			$types[$value['id']] = $value['name'];
		}
		$list = $m->find();
		$this->assign('list',$list);
		$this->assign('types',$types);
		$this->assignPage('main','doc_list');
		$this->display();
	}

	public function addAction()
	{
		//echo "string";
		$m = M("docType");
		$type_list = $m->find();

		$this->assign('type_list',$type_list);
		$this->assignPage('main','doc_add');
		$this->display();
	}

	public function insertAction()
	{
		$m = M('document');
		$m->create();
		$m->set('created_at',DATETIME);
		$result = $m->insert();
		if($result !== false)
		{
			$id = $m->getInsertId();
			if(isset($_POST['files']) && !empty($_POST['files']))
			{
				$m2 = M('docAttach');
				$m2->set('document_id',$id)->update(array_map('intval', $_POST['files']) );				
			}
			$this->to(null,'index');
		}
	}

	public function editAction()
	{
		$m = M("document");
		$id = (int)$_GET['id'];
		$data = $m->findone($id);
		$m2 = M('docType');
		$list_type = $m2->find();
		$types = array();
		foreach ($list_type as  $value) {
			$types[$value['id']] = $value['name'];
		}
		$m3 = M('docAttach');
		$list_attach = $m3->where("document_id='{$id}'")->find();
		$this->assign('attachs',$list_attach);
		$this->assign('types',$types);
		$this->assign('data',$data);
		$this->assignPage('main','doc_edit');
		$this->display();
	}

	public function updateAction()
	{
		if(!isset($_POST['published'])) $_POST['published'] = 0;
		$id = (int)$_POST['id'];
		$m = M('document');
		$m->create();
		$result = $m->update($id);
		if(false !== $result)
		{
			$m2 = M('docAttach');
			//$m2->delete(array_map('intval', $_POST['files']));
			if(isset($_POST['files']) && !empty($_POST['files']))
				$m2->set('document_id',$id)->update(array_map('intval', $_POST['files']));
		}
		$this->to(null,'index');
	}

	public function deleteAction()
	{
		$m = M('document');
		$m->delete((int)$_GET['id']);
		$this->to(null,'index');
	}
}