<?php
class docController extends Controller
{

	public $fileTypes = array('doc','docx','txt','pdf','rar','zip');

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
		$this->display("doc_list");
	}

	public function addAction()
	{
		//echo "string";
		$m = M("docType");
		$type_list = $m->find();

		$this->assign('type_list',$type_list);
		$this->display("doc_add");
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
			$m2 = M('docAttach');
			$m2->set('document_id',$id)->update($_POST['files']);
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
		$this->display('doc_edit');
	}

	public function updateAction()
	{
		if(!isset($_POST['published'])) $_POST['published'] = 0;
		$m = M('document');
		$m->create();
		$m->update((int)$_POST['id']);	
		$this->to(null,'index');
	}

	public function deleteAction()
	{
		$m = M('document');
		$m->delete((int)$_GET['id']);
		$this->to(null,'index');
	}

	public function uploadBCSAction()
	{
		$filename = $_FILES['Filedata']['name'];
		$tempFile = $_FILES['Filedata']['tmp_name'];
		$fileParts = pathinfo($_FILES['Filedata']['name']);
		//echo $fileParts['extension'];
		if (!in_array($fileParts['extension'],$this->fileTypes))
			Out::ajaxError("上传文件格式不正确");

		try {
			import('BCS/BaiduBCS');
			$baidu_bcs = new BaiduBCS ();
			$response = $baidu_bcs->create_object('dxshare','/'.START_TIME.$filename,$tempFile,array('filename'=>$filename));
			if($response->isOK())
			{
				$url = $response->header['_info']['url'];
				$m = M('docAttach');
				$result = $m->set(array('name'=>$filename,'url'=>$url,'created_at'=>DATETIME))->insert();
				if(false !== $result)
					Out::ajaxSuccess('保存成功',array('id'=>$m->getInsertId(),'name'=>$filename,'url'=>$url));
				else
					Out::ajaxSuccess('保存失败,请重试',array('id'=>$m->getInsertId(),'error'=>mysql_error()));
			}
			else
				Out::ajaxError("上传失败");			
		} catch (Exception $e) {
			Out::ajaxError("上传失败");	
		}



	}
}