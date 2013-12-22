<?php
class docTypeModel extends Model
{
	public $table_name = 'doc_type';
	
	public $pk = 'id';
	
	public $fields = array('id','name');
	
	public $name = 'docTypeModel';
	
	public $autocheck = 1;
	
	public $validate = array();

	public function getTypes()
	{
		$data = $this->find();
		$type = array();
		if($data !== false)
		{
			foreach ($data as $value) {
				$type[$value['id']] = $value['name'];
			}			
		}
		return $type;
	}
}
