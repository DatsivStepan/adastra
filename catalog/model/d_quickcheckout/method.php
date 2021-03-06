<?php
/*
 *	location: admin/model
 */

class ModelDQuickcheckoutMethod extends Model {



	
	/*
	*	Shipping method
	*/

	public function shippingRequired(){
    	if($this->cart->hasShipping()){
        	return true;
        }
        return false;
    }

	public function getFirstShippingMethod(){
		if(isset($this->session->data['shipping_methods']) && is_array($this->session->data['shipping_methods'])){
			foreach ($this->session->data['shipping_methods'] as $group){
				foreach($group['quote'] as $shipping_method){
					return $shipping_method;
				}
			}
		}
		return false;
	}

	public function getDefaultShippingMethod($default_option){
		if(!empty($default_option)){
			if(isset($this->session->data['shipping_methods']) && is_array($this->session->data['shipping_methods'])){
				foreach ($this->session->data['shipping_methods'] as $group){
					if(isset($group['quote'][$default_option])){
						return $group['quote'][$default_option];
					}
				}
			}
		}

		return $this->getFirstShippingMethod();
	}

	

	public function getShippingMethods($shipping_address){
		$method_data = array();

		$this->load->model('extension/extension');

		$results = $this->model_extension_extension->getExtensions('shipping');

		foreach ($results as $result) {

			if ($this->config->get($result['code'] . '_status')) {
   
				$this->load->model('shipping/' . $result['code']);

				$quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address);

				if ($quote) {
					$method_data[$result['code']] = array(
						'title'      => $quote['title'],
						'quote'      => $quote['quote'],
						'sort_order' => $quote['sort_order'],
						'error'      => $quote['error']
					);
				}
			}
		}

		$sort_order = array();

		foreach ($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		return $method_data;
	}

	/*
	*	Payment method
	*/

	public function getFirstPaymentMethod(){

		if(isset($this->session->data['payment_methods']) && is_array($this->session->data['payment_methods'])){
			foreach ($this->session->data['payment_methods'] as $payment_method){
				return $payment_method;
			}
		}
		return false;
	}

	public function getDefaultPaymentMethod($setting_payment_method = false){

		if(isset($this->session->data['payment_methods']) && is_array($this->session->data['payment_methods'])){
			if(array_key_exists($setting_payment_method, $this->session->data['payment_methods'])){
				return $this->session->data['payment_methods'][$setting_payment_method];
			}
		}
		return $this->getFirstPaymentMethod();
	}

	

	public function getPaymentMethods($payment_address, $total){
		$method_data = array();

		$this->load->model('extension/extension');

		$results = $this->model_extension_extension->getExtensions('payment');

		$recurring = $this->cart->hasRecurringProducts();

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('payment/' . $result['code']);

				$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);

				if ($method) {
					if ($recurring) {
						if (method_exists($this->{'model_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_payment_' . $result['code']}->recurringPayments()) {
							$method_data[$result['code']] = $method;
						}
					} else {
						$method_data[$result['code']] = $method;
					}

					if(file_exists(DIR_IMAGE.'catalog/d_quickcheckout/payment/'.$result['code'].'.png')){
						$method_data[$result['code']]['image'] = 'image/catalog/d_quickcheckout/payment/'.$result['code'].'.png';
					}
					
				}
			}
		}

		$sort_order = array();

		foreach ($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		return $method_data;
	}
}