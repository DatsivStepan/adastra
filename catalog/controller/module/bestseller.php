<?php

    global $aFolder;
    if (!defined('HTTP_ADMIN')) {
    	$root_dir = DIR_APPLICATION.'../';
    	$folder_contents = scandir($root_dir);
		if (!(in_array('admin', $folder_contents) && file_exists($root_dir.'admin/config.php'))) {
			foreach ($folder_contents as $value) {
				if (is_dir($root_dir.$value) && $value != '.' && $value != '..'){
					if (file_exists($root_dir.$value.'/config.php')) {
						$admin_folder_name = $value;
						continue;
					}
				}
			}
		}
    	if (isset($admin_folder_name)) {
    		define('HTTP_ADMIN',$admin_folder_name);
    	} else {
    		define('HTTP_ADMIN','admin');
    	}
    	
    }
    
    global $modulesPath;
    if (version_compare(VERSION,'2.3','>=')) { //newer than 2.2.x
        $modulesPath = 'extension/module';
    } else {
        $modulesPath = 'module';
    }
    
    $aFolder = preg_replace('/.*\/([^\/].*)\//is','$1',HTTP_ADMIN);
    if (!isset($GLOBALS['magictoolbox']['magicslideshow']) && !isset($GLOBALS['magicslideshow_module_loaded'])) {
	include (preg_match("/components\/com_(ayelshop|aceshop|mijoshop)\/opencart\//ims",__FILE__,$matches)?'components/com_'.$matches[1].'/opencart/':'').$aFolder.'/controller/'.$modulesPath.'/magicslideshow-opencart-module/module.php';
    };

    global $aFolder;
    if (!defined('HTTP_ADMIN')) {
    	$root_dir = DIR_APPLICATION.'../';
    	$folder_contents = scandir($root_dir);
		if (!(in_array('admin', $folder_contents) && file_exists($root_dir.'admin/config.php'))) {
			foreach ($folder_contents as $value) {
				if (is_dir($root_dir.$value) && $value != '.' && $value != '..'){
					if (file_exists($root_dir.$value.'/config.php')) {
						$admin_folder_name = $value;
						continue;
					}
				}
			}
		}
    	if (isset($admin_folder_name)) {
    		define('HTTP_ADMIN',$admin_folder_name);
    	} else {
    		define('HTTP_ADMIN','admin');
    	}
    	
    }
    
    global $modulesPath;
    if (version_compare(VERSION,'2.3','>=')) { //newer than 2.2.x
        $modulesPath = 'extension/module';
    } else {
        $modulesPath = 'module';
    }
    
    $aFolder = preg_replace('/.*\/([^\/].*)\//is','$1',HTTP_ADMIN);
    if (!isset($GLOBALS['magictoolbox']['magicslideshow']) && !isset($GLOBALS['magicslideshow_module_loaded'])) {
	include (preg_match("/components\/com_(ayelshop|aceshop|mijoshop)\/opencart\//ims",__FILE__,$matches)?'components/com_'.$matches[1].'/opencart/':'').$aFolder.'/controller/'.$modulesPath.'/magicslideshow-opencart-module/module.php';
    };
class ControllerModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/bestseller');
		$this->document->addStyle("http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css");
		$this->document->addScript("http://plugin.bearsthemes.com/jquery/MasonryHybrid/jquery-3.1.0.min.js");
		$this->document->addScript("https://code.jquery.com/ui/1.12.0/jquery-ui.js");
		$this->document->addScript("http://plugin.bearsthemes.com/jquery/MasonryHybrid/isotope.pkgd.min.js");
		$this->document->addScript("http://plugin.bearsthemes.com/jquery/MasonryHybrid/jquery.masonry-hybrid.min.js");

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['text_price'] = $this->language->get('text_price');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = HTTP_SERVER.'image/'.$result['image'];
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 0, 0);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
				$contents = $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);
			    global $aFolder;
                            global $modulesPath;
                            include($aFolder.'/controller/'.$modulesPath.'/magicslideshow-opencart-module/boxes.inc');
			    $contents = $contents;
			    global $aFolder;
                            global $modulesPath;
                            include($aFolder.'/controller/'.$modulesPath.'/magicslideshow-opencart-module/boxes.inc');
			    return $contents;
			} else {
				$contents = $this->load->view('default/template/module/bestseller.tpl', $data);
			    global $aFolder;
                            global $modulesPath;
                            include($aFolder.'/controller/'.$modulesPath.'/magicslideshow-opencart-module/boxes.inc');
			    $contents = $contents;
			    global $aFolder;
                            global $modulesPath;
                            include($aFolder.'/controller/'.$modulesPath.'/magicslideshow-opencart-module/boxes.inc');
			    return $contents;
			}
		}
	}
}
