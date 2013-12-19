<?php
class docController extends Controller
{
	public function indexAction()
	{
		//echo "string";
		$this->display("doc_list");
	}

	public function addAction()
	{
		//echo "string";
		$this->display("doc_add");
	}
}