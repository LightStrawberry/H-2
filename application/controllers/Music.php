<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Music extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->load->view('music');
	}

	public function get_all_music()
	{
		$data = $this->Music_model->get_all_music();
		$res = array('code' => '200', 'msg' => 'ok', 'data' => $data);
		echo json_encode($res);
	}

	public function get_music($id)
	{
		$data = $this->Music_model->get_music_by_id($id);
		if(!$data)
		{
			$res = array('code' => '404', 'msg' => 'error');
			echo json_encode($res);
			return;
		}
		$res = array('code' => '200', 'msg' => 'ok', 'data' => $data);
		echo json_encode($res);
	}

	public function get_random_music()
	{
		$len = $this->Music_model->get_music_count();
		$rand = (rand(1,$len));
		$res = $this->Music_model->get_music_by_id($rand);
		if(!$res)
		{
			self::get_random_music();
			return;
		}
		echo json_encode($res);
	}

	public function add_music()
	{
		$title = $this->input->post('title');
		$location = $this->input->post('location');
		$creator = $this->input->post('creator');
		$time = date('Y-m-d H:i:s');

		$artArr = array(
				"title" => $title,
				"location" => $location,
				"creator" => $creator,
				"time" => $time,
			);
		$query = $this->Music_model->insert_music($artArr);
		if($query>0)
		{
			echo "success";
		}
	}

	public function get_data($num)
	{
		$json = file_get_contents("./static/list.json",'json');
		$obj=json_decode($json,true);
		$list = $obj['playlist']['trackList']['track'];

		return $data = array('location' => $list[$num]['location'], 'title' => $list[$num]['title'], 'time' => $time = date('Y-m-d H:i:s'));

		//echo $list[0]['location']."<br>";
		//echo $list[0]['title'];
	}


	public function input()
	{
		for ($i=0; $i < 1000 ; $i++) { 
			$data = self::get_data($i);
			$this->Music_model->insert_music($data);
		}
		// for ($i = 0; $i < count($list); $i++) {
		// 	$data = array('location' => $list[$i]['location'], 'title' => $list[$i]['title']);
		// 	$this->db->insert_string('MusicX', $data);
		// }
	}
}
