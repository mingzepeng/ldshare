<?php
class indexController extends Controller
{
	public function indexAction()
	{
		//echo "string";
		import('BCS/BaiduBCS');
		$baidu_bcs = new BaiduBCS ();
		$response = $baidu_bcs->list_object('dxshare');
		var_dump($response);
		//var_dump($response->header['_info']['url']);
		$this->display("index");
	}
}