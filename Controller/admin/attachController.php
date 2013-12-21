<?php
class attachController extends Controller
{
	public $fileTypes = array('doc','docx','txt','pdf','rar','zip','php','md','markdown');

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
			$object_path = '/'.str_replace( '-', '/',DATE).'/'.START_TIME.$filename;
			$response = $baidu_bcs->create_object('dxshare',$object_path,$tempFile,array('filename'=>$filename));
			if($response->isOK())
			{
				$url = $response->header['_info']['url'];
				$m = M('docAttach');
				$result = $m->set(array('name'=>$filename,'url'=>$url,'created_at'=>DATETIME))->insert();
				if(false !== $result)
					Out::ajaxSuccess('保存成功',array('id'=>$m->getInsertId(),'name'=>$filename,'url'=>$url,'test'=>$object_path));
				else
					Out::ajaxError('保存失败,请重试',array('id'=>$m->getInsertId(),'error'=>mysql_error()));
			}
			else
				Out::ajaxError("上传失败");			
		} catch (Exception $e) {
			Out::ajaxError("上传失败");	
		}
	}

	public function deleteAction()
	{
		$m = M('docAttach');
		$result = $m->delete((int)$_GET['id']);
		if($result !== false)
			Out::ajaxSuccess('删除成功');
		else
			Out::ajaxError('删除失败');
	}
}