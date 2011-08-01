<?php

class Salas extends MY_Model {
	
	function __construct(){
		parent::__construct();
	}
	
	function cargarListaSalas (){
		$query = $this->db->get('sala');
		return $query->result();
	}
	
	function mostrarInformacionSala($id = 0){
		$query = $this->db->get_where('sala', array('id_sala' => $id));
		return $query->row_array();
	}
	
	function crearSala($data){
		$this->db->insert('sala', $data);
	}
	
	function actualizarSala($data, $id){
		$this->db->where('id_sala', $id);
        $this->db->update('sala', $data);
	}
}