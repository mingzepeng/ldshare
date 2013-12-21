<?php
/**
 * -------------------------------------------
 * 模型类，实现了基本的CURD，数据过滤操作
 * --------------------------------------------
 * @author pmz(mingzepeng@gmail.com)
 * @version 1.2  2012.6.30
 */
class Model extends Core
{
	public $name = 'Model';
	//数据库操作对象
	public $dbstuff = null;

	//数据库表前缀
	public $table_pre = '';
	//数据库表
	public $table_name = '';
	//数据库全名
	public $table_full_name = '';
	//表主键
	public $pk = null;
	//表字段
	public $fields = array();
	
	//表数据信息
	public $data = array();
	
	//构成sql的信息
	public $option = array();
	
	public $backdata = array();
	
	//是否自动检测数据
	public $autocheck = 0;
	//要检测的字段的检测方式
	public $validate = array();
	
	//是否自动调用函数或方法过滤数据
	public $auto_input_filter = 0;
	public $input_filter = array();
	
	public $auto_output_filter = 0;
	public $output_filter = array();
	
	
	/**
	 * 构造函数
	 * 
	 */ 
	public function __construct($table='')
	{
		import('Db/mysql');
		$db = Config::get('DB');
		$this->dbstuff = mysql::getInstance($db['MAIN']);
		$this->dbstuff->connect();
		$this->setTable($table,$db['MAIN']['table_pre']);
	}
	
	public function __destruct()
	{
		$this->dbstuff->close();
	    $this->dbstuff = null;
	}
	
	public function __set($var,$value)
	{
		$this->set($var,$value);
	}
	
    public function __get($var)
	{
		return $this->get($var); 
	}
	
	public function setTable($table='',$tablepre='')
	{
	    if ($table !== '') $this->table_name = $table;
	    $this->table_pre = $tablepre;
	    $this->table_full_name = $this->table_pre.$this->table_name;
	    return $this;
	}
	
	public function create($data=array())
	{
		$data = empty($data) ? $_POST : $data;
		$this->auto_input_filter && $data = $this->inputFilter($data);
		$this->autocheck && $this->_validate();
		if(!empty($this->fields))
		{
			foreach ($data as $key => $value) 
				if(!in_array($key, $this->fields)) unset($data[$key]);
		}
		$this->data = $data;
		return $this;
	}
	
	public function clear()
	{
		$this->backdata[] = array('data'=>$this->data,'option'=>$this->option);
		$this->data   = array();
		$this->option = array();
		return $this;
	}
	
    public function query($sql)
    {
        return $this->dbstuff->query($sql);	
    }
    
	public function find($pk=array())
	{
		$table = $this->table_full_name;
		$field = (isset($this->option['field']) && !empty($this->option['field'])) ? implode(',',$this->option['field']) : '*';
		$join = '';
		$where = '';
		$condition = '';
		$condition2 = '';
		if (isset($this->option['join']['matchfield']) && isset($this->option['join']['table']))
		{
			if ($field != '*') 
			{
				if (!empty($this->option['join']['field'])) $field.=','.implode($this->option['join']['field']);
			}
			$join = ' '.$this->option['join']['type'].' join '.$this->option['join']['table'].' on '.$table.'.'.$this->option['join']['matchfield'][0].'='.$this->option['join']['table'].'.'.$this->option['join']['matchfield'][1].' ';
		}

		if (!empty($this->option['condition']))
		{
		    $condition = '('.$this->option['condition'].')';
		}

		if (isset($this->pk) && count($pk)>0)
		{
			$pk = array_unique($pk);
			foreach ($pk as $key => $value) {
				$pk[$key] = "'".$value."'";
			}
			$pk ='('.implode(',',($pk)).')';
			$condition2 = "({$this->pk} in {$pk})";				
		}

		($condition !== '')  && $where = ' where '.$condition;
		if ($condition2 !== '')
		{
			if ($where !== '')
			    $where .= ' and '.$condition2.' ';
			else 
			    $where = ' where '.$condition2.' ';
		}

		$order = (isset($this->option['order']) && !empty($this->option['order']) ) ? ' order by '.$this->option['order'] : '';
		$limit = (isset($this->option['limit']) && !empty($this->option['limit']) ) ? ' limit '. $this->option['limit'] : '';
		$sql = "select {$field} from {$table} {$join} {$where} {$order} {$limit}";
		$result = $this->dbstuff->fetch($sql);
		$this->clear();
		if ($this->auto_output_filter && $result !== false) 
		{
		    foreach ($result as $key=>$value) $result[$key] = $this->outputFilter($value);
		}
		return $result;
	}
	
	public function findone($pk=null)
	{
		$table = $this->table_full_name;
		$field = (isset($this->option['field']) && !empty($this->option['field'])) ? implode(',',$this->option['field']) : '*' ;
		$join = '';
		$condition  = '';
		$condition2 = '';
		$where = '';
		if (isset($this->option['join']['matchfield']) && isset($this->option['join']['table']))
		{
			if ($field != '*') 
			{
				if (!empty($this->option['join']['field'])) $field.=','.implode($this->option['join']['field']);
			}
			$join = ' '.$this->option['join']['type'].' join '.$this->option['join']['table'].' on '.$table.'.'.$this->option['join']['matchfield'][0].'='.$this->option['join']['table'].'.'.$this->option['join']['matchfield'][1].' ';
		}
		$order = (isset($this->option['order']) && !empty($this->option['order']))?  ' order by '.$this->option['order'] : '';
		$limit =  ' limit 1';

		if (isset($this->option['condition']))
		    $condition = ' ('.$this->option['condition'].') ';

		if (isset($this->pk) && isset($pk))
		    $condition2 = ' ('.$this->pk."='".$pk."')";
		    
		($condition !== '') && $where = ' where '.$condition;
		if ($condition2 !== '')
		{
			if ($where !== '')
			    $where .= ' and '.$condition2.' ';
			else 
			    $where  = ' where '.$condition2.' ';
		}
        
		$sql = "select {$field} from {$table} {$join} {$where} {$order} {$limit}";
		$result = $this->dbstuff->fetchone($sql);
		$this->clear();
		if ($this->auto_output_filter && $result !== false)  $result = $this->outputFilter($result);
		return $result;
	}
	
	public function update($pk=null)
	{
		$table = $this->table_full_name;
		$condition = '';
		$condition2 = '';
		$where = '';
		$kv = '';

		if (isset($this->option['condition']))
		{
			$condition = '('.$this->option['condition'].')';
		}

		if (isset($this->pk) && isset($pk))
		{
		    if(is_array($pk) && count($pk)>0)
			{
				$pk = array_unique($pk);
				foreach ($pk as $key => $value) {
					$pk[$key] = "'".$value."'";
				}
				$pk ='('.implode(',',($pk)).')';
				$condition2 = "({$this->pk} in {$pk})";					
			}
			else
			{
				$condition2 = "({$this->pk} = '{$pk}')";
			}
		}

		($condition !== '') && $where = ' where '.$condition;
		if ($condition2 !== '')
		{
			if ($where !== '')
			    $where .= ' and '.$condition2.' ';
			else 
			    $where  = ' where '.$condition2.' ';
		}

		foreach ($this->data as $key=>$value) $kv .= $key.'='."'".$value."'".',';
		$kv = substr($kv,0,-1);
		$sql ="update {$table} set {$kv} {$where}";
		$result = $this->dbstuff->query($sql);
		if($result === true) $result = $this->getAffectedRows();
		$this->clear();
		return $result;
	}
	 
	public function delete($pk=null)
	{
		$table = $this->table_full_name;
		$condition = '';
		$condition2 = '';
		$where = '';
		if (isset($this->option['condition']))
		{
			$condition = '('.$this->option['condition'].')';
		}

		if (isset($this->pk) && isset($pk))
		{
		    if(is_array($pk) && count($pk)>0)
			{
				$pk = array_unique($pk);
				foreach ($pk as $key => $value) {
					$pk[$key] = "'".$value."'";
				}
				$pk ='('.implode(',',($pk)).')';
				$condition2 = "({$this->pk} in {$pk})";					
			}
			else
			{
				$condition2 = "({$this->pk} = '{$pk}')";
			}
		}

		($condition !== '') && $where = ' where '.$condition;
		if ($condition2 !== '')
		{
			if ($where !== '')
			    $where .= ' and '.$condition2.' ';
			else 
			    $where  = ' where '.$condition2.' ';
		}	

		$sql = "delete from {$table} {$where}";
		$result = $this->dbstuff->query($sql);
		if($result === true) $result = $this->getAffectedRows();
		$this->clear();
		return $result;
	}
	
	public function insert()
	{
		$table = $this->table_full_name;
		$fields = implode(',',array_keys($this->data));
		$values = "'".implode("','",array_values($this->data))."'";
		$sql = "insert into {$table} ($fields) values($values)";
		$result = $this->dbstuff->query($sql);
		if($result === true) $result = $this->getAffectedRows();
		$this->clear();
		return $result;
	}

	public function outError($info)
	{
		Out::ajaxError($info);
	}
	
	public function _validate($data = array(),$callback='outError',$method=null,$errorback='error')
	{
		if(empty($data)) $data = $this->data;
	    if(empty($this->validate)) return true;
	    $rules = $this->validate;
	    foreach ($data as $field => $value){
	        foreach ($rules as $rule){
	            if($field !== $rule[0]) continue;
	            switch ($rule[1]){
	            	case 'require':
	            		if(!isset($value) || $value === '') $this->$callback($rule[3]);
	            		break;
	            	case 'function':
	            		$fun = $rule[2];
	            		if(function_exists($fun)){
	            			if(!$fun($value)) $this->$callback($rule[3]);
	            		}else{
	            			$this->$errorback("function:$fun unavailable");
	            		}
	            	    break;
	            	case 'callback':
	            		$method = $rule[2];
	            		if(method_exists($this,$method)){
	            			if(!$this->$method($value)) $this->$callback($rule[3]);
	            		}else{
	            			$this->$errorback('object:'.__CLASS__." mehtod:$method unavailable");
	            		}
	            		break;
	            	case 'regex':
	            		if(!preg_match($rule[2],$value)) $this->$callback($rule[3]);
	            		break;
	            	case 'equal':
	            		if($value != $rule[2]) $this->$callback($rule[3]);
	            		break;
	            	case 'int':
	            		if(isset($rule[2]) && $rule[2] != '')
	            			$reg = '/^\d{'.$rule[2].'}$/i';
	            		else
	            			$reg = '/^\d+$/i';
	            		if(!preg_match($reg,$value))  $this->$callback($rule[3]);
	            		break;
					case 'char':
	            		if(isset($rule[2]) && $rule[2] != '')
	            			$reg = '/^\w{'.$rule[2].'}$/i';
	            		else
	            			$reg = '/^\w+$/i';

	            		if(!preg_match($reg,$value))  $this->$callback($rule[3]);						
						break;
					case 'length':
						if(isset($rule[2]) && $rule[2] != '')
							$reg = '/^.{'.$rule[2].'}$/i';
						else 
							$reg = '/^.+$/i';
						if(!preg_match($reg,$value))  $this->$callback($rule[3]);
						break;
	            	case 'unique':
	            		if ($this->table_full_name === '') $this->$errorback('data table unavailable');
						$sql = "select {$field} from {$this->table_full_name} where {$field}='{$value}' ";
	            		$result = $this->dbstuff->num_rows($sql);
	            		if($result > 0) $this->$callback($rule[3]);
	            		break;
					case 'enum':
						if(!in_array($value, $rule[2])) $this->$callback($rule[3]);
						break;
	            }
	    	}
	    }
	}
	
	protected function inputFilter($data,$errorback='error')
	{
	    if (empty($this->input_filter)) return $data;
	    return $this->filter($data,$this->input_filter,$errorback);
	}
	
	protected function outputFilter($data,$errorback='error')
	{
	    if (empty($this->output_filter)) return $data;
	    return $this->filter($data,$this->output_filter,$errorback);
	}
	
	protected function filter($data,$rules,$errorback='error')
	{

		foreach ($rules as $rule) 
		{
		    switch ($rule[0])
		    {
		    	case "function":
		    		$fun = $rule[1];
		    		if(!function_exists($fun)) 
		    		    $this->$errorback("function:$fun no exist");
		    		else 
		    		    $data = $fun($data);
		    		break;
		    	case "method":
		    		$method = $rule[1];
		    		if(!method_exists($this,$method)) 
		    		    $this->$errorback('object:'.__CLASS__." mehtod:$method no exist");
		    		else 
		    		    $data= $this->$method($data);
		    		break;
		    }
		}
		return $data;
	}
	
	public function set($var,$value=null)
	{
		if ($var == null) return false;
		if (is_array($var))
		{
			$this->data = array_merge($this->data,$var);
		}
		else 
		{
			if($value === null) 
				unset($this->data[$var]);
			else
				$this->data[$var] = $value;
		}
		return $this;
	}
	
	public function get($var)
	{
		if(isset( $this->data[$var])) 
		    return  $this->data[$var];
		else
		    return null;
	}
	
	public function select($fields)
	{
		if(!isset($this->option['field'])) $this->option['field'] = array();
		if (is_string($fields) && $fields !== '') 
			$this->option['field'] = array_merge($this->option['field'],explode(',',$fields));
		else
			$this->option['field'] = array_merge($this->option['field'],$fields);
		return $this;
	}
	
	public function where($condition)
	{
		if(is_string($condition) && !empty($condition)) 
		    $this->option['condition'] = $condition;
		elseif (is_array($condition) && !empty($condition))
		{
			$temp = array();
			foreach ($condition as $key=>$value) $temp[] = $key."='".$value."'";
			$this->option['condition'] = implode(' and ',$temp);
		}
		return $this;
	}
	
	public function order($order)
	{
		if(is_array($order) && !empty($order))
		    $this->option['order'] = implode(',',$order);
		elseif (is_string($order) && !empty($order))
		    $this->option['order'] = $order;
		return $this;
	}
	
	public function limit($limit)
	{
		if(is_string($limit) && !empty($limit)) $this->option['limit'] = $limit;
		return $this;
	}
	
	public function join($jontable,$matchfield,$joinfields,$type='inner')
	{
		$this->option['join']['table'] = $this->table_pre.$jontable;
		if(is_array($matchfield)) 
		{
			$this->option['join']['matchfield'] = array_values($matchfield);
		}	    
		else
		{
			$matchfield = explode(',',$matchfield);
			if (!isset($matchfield[1])) $matchfield[1] = $matchfield[0];
			$this->option['join']['matchfield'] = $matchfield;
		}
			
		if(isset($joinfields) && !empty($joinfields))
		{
		    if(!is_array($joinfields)) $joinfields = explode(',',$joinfields);
		    foreach ($joinfields as $key=>$value) $joinfields[$key] = $jontable.'.'.$value;
		    $this->option['join']['field'] = $joinfields;			
		}
		$this->option['join']['type'] = 'inner';
		return $this;
	}

	
	public function getInsertId()
	{
		return $this->dbstuff->insert_id();
	}
	
	public function getNumRows($sql)
	{
		return $this->dbstuff->num_rows($sql);
	}
	
	public function getAffectedRows()
	{
		return $this->dbstuff->affected_rows();
	}
}