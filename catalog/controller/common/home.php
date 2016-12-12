<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
        $this->load->model('tool/image');
        $this->load->model('catalog/category');

        $data['category_home'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        $this->load->model('catalog/product');
        $data['category_muse'] = $this->model_catalog_product->getOptions(25);
        //var_dump($optionData);exit;
        $a = 0;
        foreach ($categories as $category) {
            if ($a <= 4){
                $data['category_home'][] = array(
                    'name'                    => $category['name'],
                    'image'                   => $this->model_tool_image->resize($category['image'], 600, 450),
                    'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }else{
                break;
            }
            $a++;
        }

        $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
        $data['telephone'] = $this->config->get('config_telephone');
        $data['email'] = $this->config->get('config_email');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}