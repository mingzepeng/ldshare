<?php
class indexController extends Controller
{
	public function indexAction()
	{
		$this->assignPage('main','main');
		$this->display("index");
	}
}