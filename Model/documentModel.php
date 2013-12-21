<?php
class documentModel extends Model
{
	public $table_name = 'documents';
	
	public $pk = 'id';
	
	public $fields = array('id','name','description','created_at','updated_at','author_id','type_id','published');
	
	public $name = 'documentModel';
	
	//是否自动调用函数或方法过滤数据
	public $auto_input_filter = 1;

	public $input_filter = array(array('method','check'));

	protected function check($data)
	{
		if(!isset($data['published'])) $data['published'] = 0;
		if(!isset($data['updated_at'])) $data['updated_at'] = DATETIME;
		return $data;
	}
}
