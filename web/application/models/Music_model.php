<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Music_model extends CI_Model{

	public function __construct()
	{
		parent::__construct();
		//$this->tableName = (isset($arr['tableName'])) ? $arr['tableName'] : 'my_article';
	}

	public function insert_music($data){
		$this->db->insert('Musicx',$data);
		return $this->db->affected_rows();
	}

	public function get_all_music(){
		$this->db->order_by("mid", "desc");
		$query = $this->db->get('Musicx');
		return $query->result_array();
	}

	public function get_music_by_id($id)
	{
		$query = $this->db->get_where('Musicx',array('mid' => $id));
		return $query->row_array();
	}

	public function get_music_count()
	{
		$length = $this->db->count_all('Musicx');
		return $length;
	}
}