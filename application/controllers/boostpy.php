<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Boostpy extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');

		$this->load->library('grocery_CRUD');
	}

	public function _example_output($output = null)
	{
		$this->load->view('boostpy.php',$output);
	}

	public function index()
	{
		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}

	public function funciones()
	{
		try{
			$crud = new grocery_CRUD();
			$crud->set_theme('datatables');
			$crud->unset_add();
            $crud->unset_edit();
			$crud->unset_delete();
			$crud->unset_read();
			$output = $crud->render();

			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}
	
	public function anhos()
	{
		try{
			$crud = new grocery_CRUD();
			$crud->set_theme('datatables');
			$crud->unset_add();
            $crud->unset_edit();
			$crud->unset_delete();
			$crud->unset_read();
			$output = $crud->render();

			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}
	
	public function valor_funcion()
	{
		try{
			$crud = new grocery_CRUD();
			$crud->set_theme('datatables');
			$crud->set_subject('PGN: Gaso por función del estado según año');
			$crud->columns('funcion_id','anho_id', 'value_valor_funcion');
			$crud->display_as('funcion_id','Funcion');
			$crud->display_as('anho_id','Años');
			$crud->display_as('value_valor_funcion','Monto Ejecutado');
			$crud->set_relation('funcion_id','funciones','name_funcion');
			$crud->set_relation('anho_id','anhos','value_anho');
			$crud->unset_add();
            $crud->unset_edit();
			$crud->unset_delete();
			$crud->unset_read();
			$output = $crud->render();

			$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}

	

}