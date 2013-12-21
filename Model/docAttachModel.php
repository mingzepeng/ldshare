<?php
class docAttachModel extends Model
{
	public $table_name = 'doc_attach';
	
	public $pk = 'id';
	
	public $fields = array('id','name','url','created_at','document_id');
	
	public $name = 'docAttachModel';
}
