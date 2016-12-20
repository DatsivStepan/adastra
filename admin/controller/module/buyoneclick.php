<?php
class ControllerModuleBuyOneClick extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/buyoneclick');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('buyoneclick_', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['field1_title'] = $this->language->get('field1_title');
		$data['field2_title'] = $this->language->get('field2_title');
		$data['field3_title'] = $this->language->get('field3_title');
		$data['field4_title'] = $this->language->get('field4_title');
		$data['field_required'] = $this->language->get('field_required');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_preorder_name'] = $this->language->get('entry_preorder_name');
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['ya_form_title'] = $this->language->get('ya_form_title');
		$data['ya_counter_title'] = $this->language->get('ya_counter_title');
		$data['ya_identificator_title'] = $this->language->get('ya_identificator_title');
		$data['yandex_target_status_title'] = $this->language->get('yandex_target_status_title');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/buyoneclick', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/buyoneclick', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$languages = $this->model_localisation_language->getLanguages();		

		foreach ($languages as $language) {
			if (isset($this->request->post['buyoneclick_name_'.$language['language_id']])) {
				$data['buyoneclick_name_'.$language['language_id']] = $this->request->post['buyoneclick_name_'.$language['language_id']];
				$data['buyoneclick_preorder_name_'.$language['language_id']] = $this->request->post['buyoneclick_preorder_name_'.$language['language_id']];
			} else {
				$data['buyoneclick_name_'.$language['language_id']] = $this->config->get('buyoneclick_name_'.$language['language_id']);
				$data['buyoneclick_preorder_name_'.$language['language_id']] = $this->config->get('buyoneclick_preorder_name_'.$language['language_id']);
			}
		}

		if (isset($this->request->post['buyoneclick_field1_status'])) {
			$data['buyoneclick_field1_status'] = $this->request->post['buyoneclick_field1_status'];
		} else {
			$data['buyoneclick_field1_status'] = $this->config->get('buyoneclick_field1_status');
		}
		
		if (isset($this->request->post['buyoneclick_field1_required'])) {
			$data['buyoneclick_field1_required'] = $this->request->post['buyoneclick_field1_required'];
		} else {
			$data['buyoneclick_field1_required'] = $this->config->get('buyoneclick_field1_required');
		}		

		if (isset($this->request->post['buyoneclick_field2_status'])) {
			$data['buyoneclick_field2_status'] = $this->request->post['buyoneclick_field2_status'];
		} else {
			$data['buyoneclick_field2_status'] = $this->config->get('buyoneclick_field2_status');
		}
		
		if (isset($this->request->post['buyoneclick_field2_required'])) {
			$data['buyoneclick_field2_required'] = $this->request->post['buyoneclick_field2_required'];
		} else {
			$data['buyoneclick_field2_required'] = $this->config->get('buyoneclick_field2_required');
		}

		if (isset($this->request->post['buyoneclick_field3_status'])) {
			$data['buyoneclick_field3_status'] = $this->request->post['buyoneclick_field3_status'];
		} else {
			$data['buyoneclick_field3_status'] = $this->config->get('buyoneclick_field3_status');
		}
		
		if (isset($this->request->post['buyoneclick_field3_required'])) {
			$data['buyoneclick_field3_required'] = $this->request->post['buyoneclick_field3_required'];
		} else {
			$data['buyoneclick_field3_required'] = $this->config->get('buyoneclick_field3_required');
		}

		if (isset($this->request->post['buyoneclick_field4_status'])) {
			$data['buyoneclick_field4_status'] = $this->request->post['buyoneclick_field4_status'];
		} else {
			$data['buyoneclick_field4_status'] = $this->config->get('buyoneclick_field4_status');
		}
		
		if (isset($this->request->post['buyoneclick_field4_required'])) {
			$data['buyoneclick_field4_required'] = $this->request->post['buyoneclick_field4_required'];
		} else {
			$data['buyoneclick_field4_required'] = $this->config->get('buyoneclick_field4_required');
		}
		
		if (isset($this->request->post['buyoneclick_ya_counter'])) {
			$data['buyoneclick_ya_counter'] = $this->request->post['buyoneclick_ya_counter'];
		} else {
			$data['buyoneclick_ya_counter'] = $this->config->get('buyoneclick_ya_counter');
		}		
		
		if (isset($this->request->post['buyoneclick_ya_identificator'])) {
			$data['buyoneclick_ya_identificator'] = $this->request->post['buyoneclick_ya_identificator'];
		} else {
			$data['buyoneclick_ya_identificator'] = $this->config->get('buyoneclick_ya_identificator');
		}	

		if (isset($this->request->post['buyoneclick_yandex_status'])) {
			$data['buyoneclick_yandex_status'] = $this->request->post['buyoneclick_yandex_status'];
		} else {
			$data['buyoneclick_yandex_status'] = $this->config->get('buyoneclick_yandex_status');
		}		
		
		if (isset($this->request->post['buyoneclick_status'])) {
			$data['buyoneclick_status'] = $this->request->post['buyoneclick_status'];
		} else {
			$data['buyoneclick_status'] = $this->config->get('buyoneclick_status');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/buyoneclick.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/buyoneclick')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}