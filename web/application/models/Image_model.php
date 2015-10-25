<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Image_model extends CI_Model{

	public function __construct()
	{
		parent::__construct();
		//$this->tableName = (isset($arr['tableName'])) ? $arr['tableName'] : 'my_article';
	}
	public function go()
	{
		echo "goxx";
	}

	// public function get_all_music(){
	// 	$this->db->order_by("id", "desc"); 
	// 	$query = $this->db->get('music');
	// 	return $query->result_array();
	// 
}