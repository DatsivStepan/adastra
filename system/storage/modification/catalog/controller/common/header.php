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
class ControllerCommonHeader extends Controller {
	public function index() {
        $this->document->addScript("https://cdn.jsdelivr.net/sweetalert2/6.0.1/sweetalert2.min.js");
        $this->document->addStyle("https://cdn.jsdelivr.net/sweetalert2/6.0.1/sweetalert2.min.css");
		// Analytics
		$this->load->model('extension/extension');
		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code']);
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
        $data['email'] = $this->config->get('config_email');

		$data['home'] = $this->url->link('common/home');
        $data['is_home'] = '';
        if(!isset($this->request->get['route'])){
            $data['is_home'] = 'home';
        }elseif($this->request->get['route'] == 'common/home'){
            $data['is_home'] = 'home';

        }

		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['telephone2'] = $this->config->get('config_telephone2');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
        $data['slider'] = $this->load->controller('common/slideshow');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			
			    $contents =  $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);

    $magicslideshow_config = $this->config->get('magicslideshow_settings');
    if($magicslideshow_config['magicslideshow_status'] != 0) {
        $tool = magicslideshow_load_core_class($this);
        if(magicslideshow_use_effect_on($tool)) {
            return magicslideshow_set_headers($contents);
        }
    }
    return $contents;
    

    $magicslideshow_config = $this->config->get('magicslideshow_settings');
    if($magicslideshow_config['magicslideshow_status'] != 0) {
        $tool = magicslideshow_load_core_class($this);
        if(magicslideshow_use_effect_on($tool)) {
            
			    $contents =  magicslideshow_set_headers($contents);
        }
    }
    
			    $contents =  $contents;
    

    $magicslideshow_config = $this->config->get('magicslideshow_settings');
    if($magicslideshow_config['magicslideshow_status'] != 0) {
        $tool = magicslideshow_load_core_class($this);
        if(magicslideshow_use_effect_on($tool)) {
            
			    $contents =  magicslideshow_set_headers($contents);
        }
    }
    
			    $contents =  $contents;
    
		} else {
			
			    $contents =  $this->load->view('default/template/common/header.tpl', $data);

    $magicslideshow_config = $this->config->get('magicslideshow_settings');
    if($magicslideshow_config['magicslideshow_status'] != 0) {
        $tool = magicslideshow_load_core_class($this);
        if(magicslideshow_use_effect_on($tool)) {
            return magicslideshow_set_headers($contents);
        }
    }
    return $contents;
    

    $magicslideshow_config = $this->config->get('magicslideshow_settings');
    if($magicslideshow_config['magicslideshow_status'] != 0) {
        $tool = magicslideshow_load_core_class($this);
        if(magicslideshow_use_effect_on($tool)) {
            
			    $contents =  magicslideshow_set_headers($contents);
        }
    }
    
			    $contents =  $contents;
    

    $magicslideshow_config = $this->config->get('magicslideshow_settings');
    if($magicslideshow_config['magicslideshow_status'] != 0) {
        $tool = magicslideshow_load_core_class($this);
        if(magicslideshow_use_effect_on($tool)) {
            
			    $contents =  magicslideshow_set_headers($contents);
        }
    }
    
			    $contents =  $contents;
    
		}
	}

    public function contactForm(){

        $user_query = $this->db->query("SELECT email FROM " . DB_PREFIX . "user WHERE username = 'admin' AND (user_group_id = '1') AND status = '1'");

        if ($user_query->num_rows) {
            $admin_email = $user_query->row['email'];
        }
        $mailContent = '
            <table>
                <tr>
                    <td>Name</td>
                    <td>'.$_POST['name'].'</td>
                </tr>
                <tr>
                    <td>Telephone</td>
                    <td>'.$_POST['email'].'</td>
                </tr>
                <tr>
                    <td>Message</td>
                    <td>'.$_POST['message'].'</td>
                </tr>
            </table>
        ';

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');


        $mail->setTo($admin_email);
        $mail->setFrom('no-reply@artadastra.ru');
        $mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
        $mail->setText($mailContent);
        $mail->send();
        $this->response->redirect($this->url->link('information/contact/success'));

    }

    public function contactFormRu(){

        $user_query = $this->db->query("SELECT email FROM " . DB_PREFIX . "user WHERE username = 'admin' AND (user_group_id = '1') AND status = '1'");

        if ($user_query->num_rows) {
            $admin_email = $user_query->row['email'];
        }
        $mailContent = '
            <table>
                <tr>
                    <td>Name</td>
                    <td>'.$_POST['name_ru'].'</td>
                </tr>
                <tr>
                    <td>Telephone</td>
                    <td>'.$_POST['email_ru'].'</td>
                </tr>
                <tr>
                    <td>Message</td>
                    <td>'.$_POST['message_ru'].'</td>
                </tr>
            </table>
        ';

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');


        $mail->setTo($admin_email);
        $mail->setFrom('no-reply@artadastra.ru');
        $mail->setSender(html_entity_decode($this->request->post['name_ru'], ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name_ru']), ENT_QUOTES, 'UTF-8'));
        $mail->setText($mailContent);
        $mail->send();
        $this->response->redirect($this->url->link('information/contact/success'));

    }
}
