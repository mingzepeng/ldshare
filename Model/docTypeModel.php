<?php
class docTypeModel extends Model
{
	public $table_name = 'doc_type';
	
	public $pk = 'id';
	
	public $fields = array('id','name');
	
	public $name = 'docTypeModel';
	
	public $autocheck = 1;
	
	public $validate = array();
}
