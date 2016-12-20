<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = 'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
        $data['telephone'] = $this->config->get('config_telephone');
        $data['email'] = $this->config->get('config_email');

		$data['name'] = $this->config->get('config_name');
		
		$data['home'] = $this->url->link('common/home');
		$data['is_home'] = '';
		if(!isset($this->request->get['route'])){
			$data['is_home'] = 'home';
		}elseif($this->request->get['route'] == 'common/home'){
			$data['is_home'] = 'home';

		}
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

				// BuyOneClick
				$this->load->model('setting/setting');
				$current_language_id = $this->config->get('config_language_id');
				$data['buyoneclick_name'] = $this->config->get('buyoneclick_name_'.$current_language_id);
				$data['buyoneclick_preorder_name'] = $this->config->get('buyoneclick_preorder_name_'.$current_language_id);
				$data['buyoneclick_status'] = $this->config->get('buyoneclick_status');
				$data['buyoneclick_field1_status'] = $this->config->get('buyoneclick_field1_status');
				$data['buyoneclick_field1_required'] = $this->config->get('buyoneclick_field1_required');
				$data['buyoneclick_field2_status'] = $this->config->get('buyoneclick_field2_status');
				$data['buyoneclick_field2_required'] = $this->config->get('buyoneclick_field2_required');
				$data['buyoneclick_field3_status'] = $this->config->get('buyoneclick_field3_status');
				$data['buyoneclick_field3_required'] = $this->config->get('buyoneclick_field3_required');
				$data['buyoneclick_field4_status'] = $this->config->get('buyoneclick_field4_status');
				$data['buyoneclick_field4_required'] = $this->config->get('buyoneclick_field4_required');
				$data['buyoneclick_ya_identificator'] = $this->config->get('buyoneclick_ya_identificator');
				$data['buyoneclick_ya_counter'] = $this->config->get('buyoneclick_ya_counter');				
				$data['buyoneclick_yandex_status'] = $this->config->get('buyoneclick_yandex_status');				
				$data['buyoneclick_admin_email'] = $this->config->get('config_email');
				
				$this->load->language('module/buyoneclick');
				$data['buyoneclick_button'] = $this->language->get('buyoneclick_button');
				$data['buyoneclick_field1_title'] = $this->language->get('buyoneclick_field1_title');
				$data['buyoneclick_field2_title'] = $this->language->get('buyoneclick_field2_title');
				$data['buyoneclick_field3_title'] = $this->language->get('buyoneclick_field3_title');
				$data['buyoneclick_field4_title'] = $this->language->get('buyoneclick_field4_title');
				$data['buyoneclick_button_order'] = $this->language->get('buyoneclick_button_order');
				$data['buyoneclick_required_text'] = $this->language->get('buyoneclick_required_text');
				$data['buyoneclick_success'] = $this->language->get('buyoneclick_success');
				$data['buyoneclick_error_required'] = $this->language->get('buyoneclick_error_required');
				$data['buyoneclick_error_sending'] = $this->language->get('buyoneclick_error_sending');
				// BuyOneClickEnd
            

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}
}
