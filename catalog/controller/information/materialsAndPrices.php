<?php
class ControllerInformationmaterialsAndPrices extends Controller {
	public function index() {
		$this->load->language('materialsAndPrices/materialsAndPrices');

		$this->load->model('catalog/materialsAndPrices');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('Главная'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['mp_id'])) {
			$materialsAndPrices_id = (int)$this->request->get['mp_id'];
		} else {
			$materialsAndPrices_id = 0;
		}

        $materialsAndPrices_category = $this->model_catalog_materialsAndPrices->getInformationsCategory();
            $product_array = [];
        if ($materialsAndPrices_category) {
            foreach ($materialsAndPrices_category as $materialsAndPrice_c) {
                $product_array[$materialsAndPrice_c['mp_c_id']]['category_name'] = $materialsAndPrice_c['name'];
                $product_array[$materialsAndPrice_c['mp_c_id']]['category_description'] =  html_entity_decode($materialsAndPrice_c['description'], ENT_QUOTES, 'UTF-8');
                $category_products = $this->model_catalog_materialsAndPrices->getInformations($materialsAndPrice_c['mp_c_id']);
                $product_array[$materialsAndPrice_c['mp_c_id']]['category_product'][] =  $category_products;
            }
        }
         $data['product_array'] = $product_array;
//		if ($materialsAndPrices_info) {
			$this->document->setTitle('Материалы и Цены');
			$data['breadcrumbs'][] = array(
				'text' => 'Материалы и Цены',
				'href' => ''
			);


			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/materialsAndPrices.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/materialsAndPrices.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/materialsAndPrices.tpl', $data));
			}
//		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('materialsAndPrices/materialsAndPrices', 'mp_id=' . $materialsAndPrices_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
//		}
	}

	public function agree() {
		$this->load->model('catalog/materialsAndPrices');

		if (isset($this->request->get['mp_id'])) {
			$materialsAndPrices_id = (int)$this->request->get['mp_id'];
		} else {
			$materialsAndPrices_id = 0;
		}

		$output = '';

		$materialsAndPrices_info = $this->model_catalog_materialsAndPrices->getInformation($materialsAndPrices_id);

		if ($materialsAndPrices_info) {
			$output .= html_entity_decode($materialsAndPrices_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
}