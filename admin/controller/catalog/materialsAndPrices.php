<?php
class ControllerCatalogMaterialsAndPrices extends Controller {
    private $error = array();

    public function index() {
        $this->language->load('catalog/materialsAndPrices');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/materialsAndPrices');

        $this->getList();
    }
    //////////////////////////////////////////////////////////////////////
    public function addCategory(){
        $this->language->load('catalog/materialsAndPrices');
        $this->load->model('localisation/language');
        $this->load->model('catalog/materialsAndPrices');
        $data['languages'] = $this->model_localisation_language->getLanguages();


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['tab_general'] = $this->language->get('tab_general');
        $data['entry_description_category'] = $this->language->get('entry_description_category');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['category_mp'] = '';
        $url = '';
        $data['cancel'] = $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (!isset($this->request->get['mp_c_id'])) {
            $data['action'] = $this->url->link('catalog/materialsAndPrices/addCategory', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('catalog/materialsAndPrices/editCategory', 'token=' . $this->session->data['token'] . '&mp_c_id=' . $this->request->get['mp_c_id'] . $url, 'SSL');
        }

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }


        if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
            $this->model_catalog_materialsAndPrices->addInformationCategory($this->request->post);
            $url = '';
            $this->response->redirect($this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }


        $data['text_form'] = !isset($this->request->get['mp_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $this->response->setOutput($this->load->view('catalog/MAP_category_form.tpl', $data));




    }
    public function formCategory() {
        $this->language->load('catalog/materialsAndPrices');
        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['tab_general'] = $this->language->get('tab_general');
        $data['entry_description_category'] = $this->language->get('entry_description_category');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $url = '';
        $data['cancel'] = $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL');


        if (!isset($this->request->get['mp_c_id'])) {
            $data['action'] = $this->url->link('catalog/materialsAndPrices/addCategory', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('catalog/materialsAndPrices/editCategory', 'token=' . $this->session->data['token'] . '&mp_c_id=' . $this->request->get['mp_c_id'] . $url, 'SSL');
        }



        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $category_info = $this->model_catalog_materialsAndPrices->getMpCategory($this->request->get['mp_c_id']);
        foreach($category_info as $category_info_pm){
            $data['category_mp'][] = array(
                'name'             => $category_info_pm['name'],
                'description'      => $category_info_pm['description'],
            );
        }




        $data['text_form'] = !isset($this->request->get['mp_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $this->response->setOutput($this->load->view('catalog/MAP_category_form.tpl', $data));

    }

    //////////////////////////////////////////////////////////////////////
    public function add() {
        $this->language->load('catalog/materialsAndPrices');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/materialsAndPrices');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_materialsAndPrices->addmaterialsAndPrices($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }
    ///////////////////////////////////////////
    public function editCategory() {
        $this->language->load('catalog/materialsAndPrices');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/materialsAndPrices');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->model_catalog_materialsAndPrices->editInformationCategory($this->request->get['mp_c_id'], $this->request->post);
            $url = '';
            $this->response->redirect($this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }
        $this->formCategory();

    }

    ///////////////////////////////////////////


    public function edit() {
        $this->language->load('catalog/materialsAndPrices');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/materialsAndPrices');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_materialsAndPrices->editInformation($this->request->get['mp_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->language->load('catalog/materialsAndPrices');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/materialsAndPrices');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $mp_id) {
                $this->model_catalog_materialsAndPrices->deleteInformation($mp_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'id.title';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        $data['add'] = $this->url->link('catalog/materialsAndPrices/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $data['add_category'] = $this->url->link('catalog/materialsAndPrices/addCategory', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $data['delete'] = $this->url->link('catalog/materialsAndPrices/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $data['informations'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $information_total = $this->model_catalog_materialsAndPrices->getTotalInformations();

        $results_c = $this->model_catalog_materialsAndPrices->getInformationsCategory();
        foreach ($results_c as $result_c) {
            $data['mp_category'][] = array(
                'mp_c_id'          => $result_c['mp_c_id'],
                'name'             => $result_c['name'],
                'description'      => $result_c['description'],
                'edit_c'           => $this->url->link('catalog/materialsAndPrices/editCategory', 'token=' . $this->session->data['token'] . '&mp_c_id=' . $result_c['mp_c_id'] . $url, 'SSL')
                );
        }
        $results = $this->model_catalog_materialsAndPrices->getInformations($filter_data);


        foreach ($results as $result) {
            $data['materialsAndPricess'][] = array(
                'mp_id'          => $result['mp_id'],
                'title'          => $result['title'],
                'sort_order'     => $result['sort_order'],
                'edit'           => $this->url->link('catalog/materialsAndPrices/edit', 'token=' . $this->session->data['token'] . '&mp_id=' . $result['mp_id'] . $url, 'SSL')
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_title'] = $this->language->get('column_title');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_title'] = $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . '&sort=id.title' . $url, 'SSL');
        $data['sort_sort_order'] = $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . '&sort=i.sort_order' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $information_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($information_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($information_total - $this->config->get('config_limit_admin'))) ? $information_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $information_total, ceil($information_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/materialsAndPrices_list.tpl', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['mp_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_keyword'] = $this->language->get('entry_keyword');
        $data['entry_fabric_thickness'] = $this->language->get('entry_fabric_thickness');
        $data['entry_prices'] = $this->language->get('entry_prices');
        $data['entry_MPWJ'] = $this->language->get('entry_MPWJ');
        $data['entry_store'] = $this->language->get('entry_store');
        $data['entry_bottom'] = $this->language->get('entry_bottom');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_layout'] = $this->language->get('entry_layout');

        $data['help_keyword'] = $this->language->get('help_keyword');
        $data['help_fabric_thickness'] = $this->language->get('help_fabric_thickness');
        $data['help_prices'] = $this->language->get('help_prices');
        $data['help_MPWJ'] = $this->language->get('help_MPWJ');
        $data['help_bottom'] = $this->language->get('help_bottom');
        $data['help_category'] = $this->language->get('help_category');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_data'] = $this->language->get('tab_data');
        $data['tab_design'] = $this->language->get('tab_design');

        $data['entry_image'] = $this->language->get('entry_image');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['title'])) {
            $data['error_title'] = $this->error['title'];
        } else {
            $data['error_title'] = array();
        }

        if (isset($this->error['description'])) {
            $data['error_description'] = $this->error['description'];
        } else {
            $data['error_description'] = array();
        }

        if (isset($this->error['meta_title'])) {
            $data['error_meta_title'] = $this->error['meta_title'];
        } else {
            $data['error_meta_title'] = array();
        }

        if (isset($this->error['keyword'])) {
            $data['error_keyword'] = $this->error['keyword'];
        } else {
            $data['error_keyword'] = '';
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        if (!isset($this->request->get['mp_id'])) {
            $data['action'] = $this->url->link('catalog/materialsAndPrices/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('catalog/materialsAndPrices/edit', 'token=' . $this->session->data['token'] . '&mp_id=' . $this->request->get['mp_id'] . $url, 'SSL');
        }

        $data['cancel'] = $this->url->link('catalog/materialsAndPrices', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['mp_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $information_info = $this->model_catalog_materialsAndPrices->getInformation($this->request->get['mp_id']);
        }

        $data['token'] = $this->session->data['token'];

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $category_select = $this->model_catalog_materialsAndPrices->getInformationsCategory();
        $data['category_s']=$category_select;

        if (isset($this->request->post['information_description'])) {
            $data['information_description'] = $this->request->post['information_description'];
        } elseif (isset($this->request->get['mp_id'])) {
            $data['information_description'] = $this->model_catalog_materialsAndPrices->getInformationDescriptions($this->request->get['mp_id']);
        } else {
            $data['information_description'] = array();
        }

        $this->load->model('setting/store');

        $data['stores'] = $this->model_setting_store->getStores();

        if (isset($this->request->post['information_store'])) {
            $data['information_store'] = $this->request->post['information_store'];
        } elseif (isset($this->request->get['mp_id'])) {
            $data['information_store'] = $this->model_catalog_materialsAndPrices->getInformationStores($this->request->get['mp_id']);
        } else {
            $data['information_store'] = array(0);
        }

        if (isset($this->request->post['keyword'])) {
            $data['keyword'] = $this->request->post['keyword'];
        } elseif (!empty($information_info)) {
            $data['keyword'] = $information_info['keyword'];
        } else {
            $data['keyword'] = '';
        }
////////////////////////////////////////////////////////////////////
        if (isset($this->request->post['fabric_thickness'])) {
            $data['fabric_thickness'] = $this->request->post['fabric_thickness'];
        } elseif (!empty($information_info)) {
            $data['fabric_thickness'] = $information_info['fabric_thickness'];
        } else {
            $data['fabric_thickness'] = '';
        }

        if (isset($this->request->post['prices'])) {
            $data['prices'] = $this->request->post['prices'];
        } elseif (!empty($information_info)) {
            $data['prices'] = $information_info['prices'];
        } else {
            $data['prices'] = '';
        }
        if (isset($this->request->post['MPWJ'])) {
            $data['MPWJ'] = $this->request->post['MPWJ'];
        } elseif (!empty($information_info)) {
            $data['MPWJ'] = $information_info['MPWJ'];
        } else {
            $data['MPWJ'] = '';
        }
        if (isset($this->request->post['category'])) {
            $data['category'] = $this->request->post['category'];
        } elseif (!empty($information_info)) {
            $data['category'] = $information_info['category'];
        } else {
            $data['category'] = '';
        }
///////////////////////////////////////////////////////////////////////////////////////////////////
        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($mp_info)) {
            $data['image'] = $information_info['image'];
        } else {
            $data['image'] = '';
        }
        $this->load->model('tool/image');

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($information_info) && is_file(DIR_IMAGE . $information_info['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($information_info['image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);


        if (isset($this->request->post['bottom'])) {
            $data['bottom'] = $this->request->post['bottom'];
        } elseif (!empty($information_info)) {
            $data['bottom'] = $information_info['bottom'];
        } else {
            $data['bottom'] = 0;
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($information_info)) {
            $data['status'] = $information_info['status'];
        } else {
            $data['status'] = true;
        }

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($information_info)) {
            $data['sort_order'] = $information_info['sort_order'];
        } else {
            $data['sort_order'] = '';
        }

        if (isset($this->request->post['information_layout'])) {
            $data['information_layout'] = $this->request->post['information_layout'];
        } elseif (isset($this->request->get['mp_id'])) {
            $data['information_layout'] = $this->model_catalog_materialsAndPrices->getInformationLayouts($this->request->get['mp_id']);
        } else {
            $data['information_layout'] = array();
        }

        $this->load->model('design/layout');

        $data['layouts'] = $this->model_design_layout->getLayouts();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/materialsAndPrices_form.tpl', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/materialsAndPrices')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['information_description'] as $language_id => $value) {
            if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
                $this->error['title'][$language_id] = $this->language->get('error_title');
            }

            if (utf8_strlen($value['description']) < 3) {
                $this->error['description'][$language_id] = $this->language->get('error_description');
            }

            if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
                $this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
            }
        }

        if (utf8_strlen($this->request->post['keyword']) > 0) {
            $this->load->model('catalog/url_alias');

            $url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

            if ($url_alias_info && isset($this->request->get['mp_id']) && $url_alias_info['query'] != 'mp_id=' . $this->request->get['mp_id']) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }

            if ($url_alias_info && !isset($this->request->get['mp_id'])) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function validateDelete() {
//        if (!$this->user->hasPermission('modify', 'catalog/materialsAndPrices')) {
//            $this->error['warning'] = $this->language->get('error_permission');
//        }
//
//        $this->load->model('setting/store');
//
//        foreach ($this->request->post['selected'] as $mp_id) {
//            if ($this->config->get('config_account_id') == $mp_id) {
//                $this->error['warning'] = $this->language->get('error_account');
//            }
//
//            if ($this->config->get('config_checkout_id') == $mp_id) {
//                $this->error['warning'] = $this->language->get('error_checkout');
//            }
//
//            if ($this->config->get('config_affiliate_id') == $mp_id) {
//                $this->error['warning'] = $this->language->get('error_affiliate');
//            }
//
//            if ($this->config->get('config_return_id') == $mp_id) {
//                $this->error['warning'] = $this->language->get('error_return');
//            }
//
//            $store_total = $this->model_setting_store->getTotalStoresByInformationId($mp_id);
//
//            if ($store_total) {
//                $this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
//            }
//        }

        return !$this->error;
    }
}