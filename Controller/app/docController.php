<?php
class docController extends Controller
{
	public function detailAction()
	{
		$id = (int)$_GET['id'];
		$m = M("document");
		$doc = $m->findone($id);
		$m2 = M("docAttach");
		$attachs = $m2->where("document_id='{$id}'")->find();

		$type_id = $doc['type_id'];
		$m3 = M("docType");
		$type = $m3->select('name')->findone($type_id);
		if($type !== false)
			$type_name = $type['name'];
		else
			$type_name = '无';
		$this->assign("type_name",$type_name);
		$this->assign("attachs",$attachs);
		$this->assign("doc",$doc);
		$this->assignPage('content','detail');//exit($type_name);
		$this->display('index');
	}
}