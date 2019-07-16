<?php defined('BASEPATH') OR exit('No direct script access allowed');

class AddStock extends MY_Controller
{

    function __construct() {
        parent::__construct();


        if (!$this->loggedIn) {
            redirect('login');
        }

        $this->load->library('form_validation');
        $this->load->model('stock_model');
    }

    function index() {

        $stores = $this->site->getAllStores();
        if ($this->input->get('store_id') && !$this->session->userdata('has_store_id')) {
            $this->data['store'] = $this->site->getStoreByID($this->input->get('store_id', TRUE));
        } elseif ($this->session->userdata('store_id')) {
            $this->data['store'] = $this->site->getStoreByID($this->session->userdata('store_id'));
        } else {
            $this->data['store'] = current($stores);
        }
        $this->data['stores'] = $stores;
        $data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['page_title'] = lang('products');
        $bc = array(array('link' => '#', 'page' => lang('products')));
        $meta = array('page_title' => lang('products'), 'bc' => $bc);
        $this->page_construct('products/index', $this->data, $meta);

    }

  
    function view($id = NULL) {
        $data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $product = $this->site->getProductByID($id);
        $this->data['product'] = $product;
        $this->data['category'] = $this->site->getCategoryByID($product->category_id);
        $this->data['combo_items'] = $product->type == 'combo' ? $this->products_model->getComboItemsByPID($id) : NULL;
        $this->load->view($this->theme.'products/view', $this->data);

    }

   

    function add() {
        if (!$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            redirect('pos');
        }

      
        $this->form_validation->set_rules('product', 'Product', 'required');
        $this->form_validation->set_rules('quantity', 'quantity', 'is_numeric');

        if ($this->form_validation->run() == true) {
            if ($this->input->post('sellas') && $this->input->post('quantityas')) {
                    $sellasvalue = $this->tec->sellAsVaule($this->input->post('sellas'));
                    $qtt =  $this->input->post('quantity');
                    $multipliedByQty = $sellasvalue * $qtt;
                }


            $data = array(
                'product_id' => $this->input->post('product'),
                'store_id' => $this->input->post('store_id'),
                'quantity' =>empty($multipliedByQty) ? $this->input->post('quantity') : $multipliedByQty,
                );

        }

        if ($this->form_validation->run() == true && $this->products_model->addStock($data)) {

            $this->session->set_flashdata('message', 'stock added successfully'));
            redirect('products');

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['categories'] = $this->site->getAllProducts();
            $this->data['sellases'] = $this->site->getAllSellases();
            $this->data['page_title'] = 'Add Stock';
            $bc = array(array('link' => site_url('products'), 'page' => lang('products')), array('link' => '#', 'page' => lang('add_product')));
            $meta = array('page_title' => 'Add Stock', 'bc' => $bc);
            $this->page_construct('addstock/add', $this->data, $meta);

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

        $pr_details = $this->site->getProductByID($id);
        if ($this->input->post('code') != $pr_details->code) {
            $this->form_validation->set_rules('code', lang("product_code"), 'is_unique[products.code]');
        }
        $this->form_validation->set_rules('code', lang("product_code"), 'trim|min_length[2]|max_length[50]|required');
        $this->form_validation->set_rules('name', lang("product_name"), 'required');
        $this->form_validation->set_rules('category', lang("category"), 'required');
        $this->form_validation->set_rules('price', lang("product_price"), 'required|is_numeric');
        $this->form_validation->set_rules('cost', lang("product_cost"), 'required|is_numeric');
        $this->form_validation->set_rules('product_tax', lang("product_tax"), 'required|is_numeric');
        $this->form_validation->set_rules('alert_quantity', lang("alert_quantity"), 'is_numeric');

        if ($this->form_validation->run() == true) {

            $data = array(
                'type' => $this->input->post('type'),
                'code' => $this->input->post('code'),
                'name' => $this->input->post('name'),
                'category_id' => $this->input->post('category'),
                'sellasid' => $this->input->post('sellas'),
                'price' => $this->input->post('price'),
                'cost' => $this->input->post('cost'),
                'tax' => $this->input->post('product_tax'),
                'tax_method' => $this->input->post('tax_method'),
                'alert_quantity' => $this->input->post('alert_quantity'),
                'details' => $this->input->post('details'),
                'barcode_symbology' => $this->input->post('barcode_symbology'),
                );
               if ($this->input->post('sellas') && $this->input->post('quantityas')) {

                    $sellasvalue = $this->tec->sellAsVaule($this->input->post('sellas'));
                    $qtt =  $this->input->post('quantity');
                    $multipliedByQty = $sellasvalue * $qtt;
                }
            if ($this->Settings->multi_store) {
                $stores = $this->site->getAllStores();
               
                foreach ($stores as $store) {

                    $store_quantities[] = array(
                        'store_id' => $store->id,
                        'quantity' => $this->input->post('quantity'.$store->id),
                        'price' => $this->input->post('price'.$store->id)
                        );
                }
            } else {
                $store_quantities[] = array(
                    'store_id' => 1,
                    'quantity' => empty($multipliedByQty) ? $this->input->post('quantity') : $multipliedByQty ,
                    'price' => $this->input->post('price'),
                    );
            }
            if ($this->input->post('type') == 'combo') {
                $c = sizeof($_POST['combo_item_code']) - 1;
                for ($r = 0; $r <= $c; $r++) {
                    if (isset($_POST['combo_item_code'][$r]) && isset($_POST['combo_item_quantity'][$r])) {
                        $items[] = array(
                            'item_code' => $_POST['combo_item_code'][$r],
                            'quantity' => $_POST['combo_item_quantity'][$r]
                        );
                    }
                }
            } else {
                $items = array();
            }

            if ($_FILES['userfile']['size'] > 0) {

                $this->load->library('upload');

                $config['upload_path'] = 'uploads/';
                $config['allowed_types'] = 'gif|jpg|png';
                $config['max_size'] = '500';
                $config['max_width'] = '800';
                $config['max_height'] = '800';
                $config['overwrite'] = FALSE;
                $config['encrypt_name'] = TRUE;
                $this->upload->initialize($config);

                if (!$this->upload->do_upload()) {
                    $error = $this->upload->display_errors();
                    $this->session->set_flashdata('error', $error);
                    redirect("products/add");
                }

                $photo = $this->upload->file_name;
                $data['image'] = $photo;

                $this->load->library('image_lib');
                $config['image_library'] = 'gd2';
                $config['source_image'] = 'uploads/' . $photo;
                $config['new_image'] = 'uploads/thumbs/' . $photo;
                $config['maintain_ratio'] = TRUE;
                $config['width'] = 110;
                $config['height'] = 110;

                $this->image_lib->clear();
                $this->image_lib->initialize($config);

                if (!$this->image_lib->resize()) {
                    $this->session->set_flashdata('error', $this->image_lib->display_errors());
                    redirect("products/add");
                }

            }
            // $this->tec->print_arrays($data, $items);
        }

        if ($this->form_validation->run() == true && $this->products_model->updateProduct($id, $data, $store_quantities, $items, $photo)) {

            $this->session->set_flashdata('message', lang("product_updated"));
            redirect("products");

        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $product = $this->site->getProductByID($id);
            if($product->type == 'combo') {
                $combo_items = $this->products_model->getComboItemsByPID($id);
                foreach ($combo_items as $combo_item) {
                    $cpr = $this->site->getProductByID($combo_item->id);
                    $cpr->qty = $combo_item->qty;
                    $items[] = array('id' => $cpr->id, 'row' => $cpr);
                }
                $this->data['items'] = $items;
            }
            $this->data['product'] = $product;
            $this->data['stores'] = $this->site->getAllStores();
            $this->data['stores_quantities'] = $this->Settings->multi_store ? $this->products_model->getStoresQuantity($id) : $this->products_model->getStoreQuantity($id);
            $this->data['categories'] = $this->site->getAllCategories();
            $this->data['sellases'] = $this->site->getAllSellases();
            $this->data['page_title'] = lang('edit_product');
            $bc = array(array('link' => site_url('products'), 'page' => lang('products')), array('link' => '#', 'page' => lang('edit_product')));
            $meta = array('page_title' => lang('edit_product'), 'bc' => $bc);
            $this->page_construct('products/edit', $this->data, $meta);

        }
    }

    function suggestions() {
         $term = $this->input->get('term', TRUE);

         $rows = $this->products_model->getProductNames($term);
         if ($rows) {
             foreach ($rows as $row) {
                 $row->qty = 1;
                 $pr[] = array('id' => str_replace(".", "", microtime(true)), 'item_id' => $row->id, 'label' => $row->name . " (" . $row->code . ")", 'row' => $row);
             }
             echo json_encode($pr);
         } else {
             echo json_encode(array(array('id' => 0, 'label' => lang('no_match_found'), 'value' => $term)));
         }
     }

}
