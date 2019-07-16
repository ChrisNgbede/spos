<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Sellas_model extends CI_Model
{

    public function __construct() {
        parent::__construct();
    }

    public function addSellas($data) {
        if ($this->db->insert('sellas', $data)) {
            return true;
        }
        return false;
    }

    public function add_sellas($data = array()) {
        if ($this->db->insert_batch('sellas', $data)) {
            return true;
        }
        return false;
    }

    public function updateSellas($id, $data = NULL) {
        if ($this->db->update('sellas', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function deleteSellas($id) {
        if ($this->db->delete('sellas', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

}
