<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sellas extends MY_Controller
{

    function __construct() {
        parent::__construct();


        if (!$this->loggedIn) {
            redirect('login');
        }

        $this->load->library('form_validation');
        $this->load->model('Sellas_model');
    }

    function index() {
        $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['sellas'] = $this->site->getAllsellases();
        $this->data['page_title'] = lang('sellas');
        $bc = array(array('link' => '#', 'page' => lang('sellas')));
        $meta = array('page_title' => lang('sellas'), 'bc' => $bc);
        $this->page_construct('sellas/index', $this->data, $meta);

    }

    function get_sellas() {

        $this->load->library('datatables');
        $this->datatables->select("id, code, name, sellasvalue");
        $this->datatables->from('sellas');
        $this->datatables->add_column("Actions", "<div class='text-center'><div class='btn-group'><a href='" . site_url('sellas/edit/$1') . "' title='" . lang("edit_sellas") . "' class='tip btn btn-warning btn-xs'><i class='fa fa-edit'></i></a><a href='" . site_url('sellas/delete/$1') . "' onClick=\"return confirm('" . lang('alert_x_sellas') . "')\" title='" . lang("delete_sellas") . "' class='tip btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></a></div></div>", "id, code, name, sellasvalue");
        $this->datatables->unset_column('id');
        echo $this->datatables->generate();

    }

    function add() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

        $this->form_validation->set_rules('name', lang('sellas_name'), 'required');

        if ($this->form_validation->run() == true) {
            $data = array('code' => $this->input->post('code'), 'name' => $this->input->post('name'), 'sellasvalue' => $this->input->post('sellasvalue'));

        }

        if ($this->form_validation->run() == true && $this->Sellas_model->addSellas($data)) {

            $this->session->set_flashdata('message', lang('sellas_added'));
            redirect("sellas");

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['page_title'] = lang('add_sellas');
            $bc = array(array('link' => site_url('sellas'), 'page' => lang('sellas')), array('link' => '#', 'page' => lang('add_sellas')));
            $meta = array('page_title' => lang('add_sellas'), 'bc' => $bc);
            $this->page_construct('sellas/add', $this->data, $meta);
        }
    }

    function edit($id = NULL) {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $this->form_validation->set_rules('name', lang('sellas_name'), 'required');

        if ($this->form_validation->run() == true) {
           $data = array('code' => $this->input->post('code'), 'name' => $this->input->post('name'), 'sellasvalue' => $this->input->post('sellasvalue'));
        }

        if ($this->form_validation->run() == true && $this->Sellas_model->updateSellas($id, $data)) {

            $this->session->set_flashdata('message', lang('sellas_updated'));
            redirect("sellas");

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['sellas'] = $this->site->getSellasByID($id);
            $this->data['page_title'] = lang('new_sellas');
            $bc = array(array('link' => site_url('sellas'), 'page' => lang('sellas')), array('link' => '#', 'page' => lang('edit_sellas')));
            $meta = array('page_title' => lang('edit_sellas'), 'bc' => $bc);
            $this->page_construct('sellas/edit', $this->data, $meta);

        }
    }

    function delete($id = NULL) {
        if(DEMO) {
            $this->session->set_flashdata('error', lang('disabled_in_demo'));
            redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'welcome');
        }
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if ($this->sellas_model->deleteSellas($id)) {
            $this->session->set_flashdata('message', lang("sellas_deleted"));
            redirect('sellas');
        }
    }


}
