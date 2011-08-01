<?php

class Settings extends Admin_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('salas');
	}
	
	function index(){
		
		Template::set('listasala', $this->salas->cargarListaSalas());
		Template::render();
	}
	
	function formSala (){
		$sala = array();
		$datos = array();
		
		if (isset($_POST['editar'])) {
			$sala = $this->salas->mostrarInformacionSala($_POST['sala']);
		}else {
		
		$this->form_validation->set_rules('nombre', 'Nombre sala', 'required');
		$this->form_validation->set_rules('asientos', 'Cantidad asientos', 'required|integer');
		
	    if ($this->form_validation->run() == TRUE){
	    	$datos['nombre'] = $_POST['nombre'];
	    	$datos['asientos'] = $_POST['asientos'];
	    	$datos['descripcion'] = $_POST['descripcion'];
	    	
			if (empty($_POST['idsala'])){
				$this->salas->crearSala($datos);
			}else{
				$this->salas->crearSala($datos, $_POST['idsala']);
			}
			
			redirect('admin/settings/salas');
		}
		
		}
		
		Template::set('sala', $sala);
		Template::set_view('settings/formSala');
		Template::render();
	}
	
}


?>