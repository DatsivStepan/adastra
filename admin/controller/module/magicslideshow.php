<?php
// error_reporting(E_ALL);
// ini_set('display_errors', '1');


global $modulesPath;
global $breadcrumbsPath;

if (version_compare(VERSION,'2.3','>=')) { //newer than 2.2.x
    $modulesPath = 'extension/module';
    $breadcrumbsPath = 'extension';
    $englishPath = 'en-gb';
    class_alias('ControllerModuleMagicSlideshow','ControllerExtensionModuleMagicSlideshow'); //hack the class system
} else {
    $breadcrumbsPath = $modulesPath = 'module';
    $englishPath = 'english';
}

require_once (DIR_APPLICATION . 'controller/'.$modulesPath.'/magicslideshow-opencart-module/module.php');

$tool = & magicslideshow_load_core_class();



class ControllerModuleMagicSlideshow extends Controller {
    private $error = array();
    private $params = array();
    
    public $blocks = array(
		'default' => 'General',
		'bestseller' => 'Bestsellers block',
		'special' => 'Specials block',
		'featured' => 'Featured block',
		'latest' => 'Latest block',
	);
    public $map = array(
		'default' => array(
			'Positioning and Geometry' => array(
				'right-thumb-max-width',
				'right-thumb-max-height',
				'left-thumb-max-width',
				'left-thumb-max-height',
				'home-thumb-max-width',
				'home-thumb-max-height',
				'home-selector-thumb-max-width',
				'home-selector-thumb-max-height',
				'square-images',
			),
			'Common settings' => array(
				'width',
				'height',
				'orientation',
				'arrows',
				'loop',
				'effect',
				'effect-speed',
			),
			'Autoplay' => array(
				'autoplay',
				'slide-duration',
				'shuffle',
				'kenburns',
				'pause',
			),
			'Selectors' => array(
				'selectors',
				'selectors-style',
				'selectors-eye',
			),
			'Caption' => array(
				'caption',
				'caption-effect',
			),
			'Other settings' => array(
				'fullscreen',
				'preload',
				'keyboard',
				'loader',
			),
			'Miscellaneous' => array(
				'z-index',
				'show-message',
				'message',
				'imagemagick',
				'image-quality',
			),
			'Watermark' => array(
				'watermark',
				'watermark-max-width',
				'watermark-max-height',
				'watermark-opacity',
				'watermark-position',
				'watermark-offset-x',
				'watermark-offset-y',
			),
		),
		'bestseller' => array(
			'General' => array(
				'page-status',
			),
			'Positioning and Geometry' => array(
				'right-thumb-max-width',
				'right-thumb-max-height',
				'left-thumb-max-width',
				'left-thumb-max-height',
				'home-thumb-max-width',
				'home-thumb-max-height',
				'home-selector-thumb-max-width',
				'home-selector-thumb-max-height',
			),
			'Common settings' => array(
				'width',
				'height',
				'orientation',
				'arrows',
				'loop',
				'effect',
				'effect-speed',
			),
			'Autoplay' => array(
				'autoplay',
				'slide-duration',
				'shuffle',
				'kenburns',
				'pause',
			),
			'Selectors' => array(
				'selectors',
				'selectors-style',
				'selectors-eye',
			),
			'Caption' => array(
				'caption',
				'caption-effect',
			),
			'Other settings' => array(
				'fullscreen',
				'preload',
				'keyboard',
				'loader',
			),
			'Miscellaneous' => array(
				'z-index',
				'show-message',
				'message',
			),
		),
		'special' => array(
			'General' => array(
				'page-status',
			),
			'Positioning and Geometry' => array(
				'right-thumb-max-width',
				'right-thumb-max-height',
				'left-thumb-max-width',
				'left-thumb-max-height',
				'home-thumb-max-width',
				'home-thumb-max-height',
				'home-selector-thumb-max-width',
				'home-selector-thumb-max-height',
			),
			'Common settings' => array(
				'width',
				'height',
				'orientation',
				'arrows',
				'loop',
				'effect',
				'effect-speed',
			),
			'Autoplay' => array(
				'autoplay',
				'slide-duration',
				'shuffle',
				'kenburns',
				'pause',
			),
			'Selectors' => array(
				'selectors',
				'selectors-style',
				'selectors-eye',
			),
			'Caption' => array(
				'caption',
				'caption-effect',
			),
			'Other settings' => array(
				'fullscreen',
				'preload',
				'keyboard',
				'loader',
			),
			'Miscellaneous' => array(
				'z-index',
				'show-message',
				'message',
			),
		),
		'featured' => array(
			'General' => array(
				'page-status',
			),
			'Positioning and Geometry' => array(
				'right-thumb-max-width',
				'right-thumb-max-height',
				'left-thumb-max-width',
				'left-thumb-max-height',
				'home-thumb-max-width',
				'home-thumb-max-height',
				'home-selector-thumb-max-width',
				'home-selector-thumb-max-height',
			),
			'Common settings' => array(
				'width',
				'height',
				'orientation',
				'arrows',
				'loop',
				'effect',
				'effect-speed',
			),
			'Autoplay' => array(
				'autoplay',
				'slide-duration',
				'shuffle',
				'kenburns',
				'pause',
			),
			'Selectors' => array(
				'selectors',
				'selectors-style',
				'selectors-eye',
			),
			'Caption' => array(
				'caption',
				'caption-effect',
			),
			'Other settings' => array(
				'fullscreen',
				'preload',
				'keyboard',
				'loader',
			),
			'Miscellaneous' => array(
				'z-index',
				'show-message',
				'message',
			),
		),
		'latest' => array(
			'General' => array(
				'page-status',
			),
			'Positioning and Geometry' => array(
				'right-thumb-max-width',
				'right-thumb-max-height',
				'left-thumb-max-width',
				'left-thumb-max-height',
				'home-thumb-max-width',
				'home-thumb-max-height',
				'home-selector-thumb-max-width',
				'home-selector-thumb-max-height',
			),
			'Common settings' => array(
				'width',
				'height',
				'orientation',
				'arrows',
				'loop',
				'effect',
				'effect-speed',
			),
			'Autoplay' => array(
				'autoplay',
				'slide-duration',
				'shuffle',
				'kenburns',
				'pause',
			),
			'Selectors' => array(
				'selectors',
				'selectors-style',
				'selectors-eye',
			),
			'Caption' => array(
				'caption',
				'caption-effect',
			),
			'Other settings' => array(
				'fullscreen',
				'preload',
				'keyboard',
				'loader',
			),
			'Miscellaneous' => array(
				'z-index',
				'show-message',
				'message',
			),
		),
	);

    public function index () {
    
            global $modulesPath;
            global $breadcrumbsPath;
            
            $tool = $GLOBALS["magictoolbox"]["magicslideshow"];
            $shop_dir = str_replace('system/', '', DIR_SYSTEM);
            $image_dir = str_replace($shop_dir, '', DIR_IMAGE);
            $pathToCache = '/'.$image_dir.'magictoolbox_cache';

            $this->language->load($modulesPath.'/magicslideshow'); // load lang. file
	    $this->load->model('setting/setting');

            if (method_exists($this->document, 'setTitle')) {
		$this->document->setTitle($this->language->get('title'));
	    } else {
		$this->document->title = $this->language->get('title'); //load title
	    }

            $this->load->model('setting/setting');//just include file admin/model/setting/setting.php and create object ModelSettingSetting

            $token = isset($this->session->data['token'])? '&token='.$this->session->data['token']:'';

            if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
                if(isset($this->request->post['clear_cache']) && $this->request->post['clear_cache'] == '1') {
                    //clear cache
                    $this->params = $this->model_setting_setting->getSetting('magicslideshow');//load settings from DB
                    foreach ($tool->params->getParams() as $param => $values) {
                        if (isset($this->params[$values['id']])) {
                            $tool->params->setValue($values['id'],$this->params[$values['id']]);
                        }
                    }

                    require_once(DIR_APPLICATION . 'controller/'.$modulesPath.'/magicslideshow-opencart-module/magictoolbox.imagehelper.class.php');

                    $imagehelper = new MagicToolboxImageHelperClass($shop_dir, $pathToCache, $tool->params);
                    $usedSubCache = $imagehelper->getOptionsHash();
                    if(is_dir($shop_dir.$pathToCache))
                        $this->clearCache($shop_dir.$pathToCache, ($this->request->post['what-clear'] == 'all_items')?null:$usedSubCache);
                } else {
                    //save params
                    unset($this->request->post['clear_cache']);
                    unset($this->request->post['what-clear']);
                    
                    $finalSettings = array('magicslideshow_settings' => $this->request->post); //serialize to avoid module name check for each option
                    
		    $this->model_setting_setting->editSetting('magicslideshow', $finalSettings);
		    $this->params = $this->model_setting_setting->getSetting('magicslideshow');//load settings from DB
                    
                    if (VERSION < 2) {
			//$this->model_setting_setting->editSetting('magicslideshow', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module' . $token);
                    } else {
			$this->session->data['success'] = $this->language->get('text_success');
                        $this->response->redirect($this->url->link('extension/'.$breadcrumbsPath, 'token=' . $this->session->data['token'], 'SSL'));

                    }
                    
                    
                }
                
            }

            $extension_data['heading_title'] = $this->language->get('heading_title');

            $extension_data['text_enabled'] = $this->language->get('text_enabled');
            $extension_data['text_disabled'] = $this->language->get('text_disabled');

            $extension_data['entry_status'] = $this->language->get('entry_status');

            $extension_data['button_save'] = $this->language->get('button_save');
            $extension_data['button_cancel'] = $this->language->get('button_cancel');
            $extension_data['button_clear'] = $this->language->get('button_clear');
            
	    $extension_data['blocks'] = $this->blocks;
	    
            $this->params = $this->model_setting_setting->getSetting('magicslideshow');//load settings from DB
            
	    if (isset($this->params['magicslideshow_settings'])) {
		$this->params = $this->params['magicslideshow_settings'];
	    } else {
		$this->params = array();
	    }
	    
	    
	    $defaults = $tool->params->getParams();
	    
	    if (!count($this->params)) { //first time page config loaded after save
		foreach ($this->blocks as $profile_id => $profile_name) {
		    $tool->params->appendParams($defaults,$profile_id);
		}
	    } else {
		foreach ($this->blocks as $profile_id => $profile_name) {
		    foreach ($defaults as $id => $values) {
			if (isset($this->params[$profile_id.'_'.$id])) { //param profile naming
			    $tool->params->setValue($id,$this->params[$profile_id.'_'.$id],$profile_id);
			}
		    }
		}
	    }
	    
	    
	    
            foreach ($tool->params->getParams() as $param => $values) {
                if (isset($this->params[$values['id']])) {
                    $tool->params->setValue($values['id'],$this->params[$values['id']]);
                }
            }

            require_once(DIR_APPLICATION . 'controller/'.$modulesPath.'/magicslideshow-opencart-module/magictoolbox.imagehelper.class.php');

            $imagehelper = new MagicToolboxImageHelperClass($shop_dir, $pathToCache, $tool->params);
            $usedSubCache = $imagehelper->getOptionsHash();
            $cacheInfo = $this->MagicSlideshowgetCacheInfo($shop_dir.$pathToCache, $usedSubCache);
            $extension_data['path_to_cache'] = $pathToCache;
            $extension_data['total_items'] = $cacheInfo['totalCount'].' ('.$this->MagicSlideshowformat_size($cacheInfo['totalSize']).')';
            $extension_data['unused_items'] = $cacheInfo['unusedCount'].' ('.$this->MagicSlideshowformat_size($cacheInfo['unusedSize']).')';


            $profiles = $tool->params->getProfiles();
	    foreach ($profiles as $profile) {
	      $extension_data['parameters'][$profile] = $tool->params->getParams($profile); // LOAD PARAMS
	    }

            if (isset($this->error['warning'])) {
                    $extension_data['error_warning'] = $this->error['warning'];
            } else {
                    $extension_data['error_warning'] = '';
            }

            if (isset($this->error['code'])) {
                    $extension_data['error_code'] = $this->error['code'];
            } else {
                    $extension_data['error_code'] = '';
            }

            $extension_data['breadcrumbs'] = array();

            $extension_data['breadcrumbs'][] = array(
            'href'      => HTTPS_SERVER . 'index.php?route=common/dashboard' . $token,
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
            );

            $extension_data['breadcrumbs'][] = array(
            'href'      => HTTPS_SERVER . 'index.php?route=extension/'.$breadcrumbsPath . $token,
            'text'      => $this->language->get('text_module'),
            'separator' => ' :: '
            );

            $extension_data['breadcrumbs'][] = array(
            'href'      => HTTPS_SERVER . 'index.php?route='.$modulesPath.'/magicslideshow' . $token,
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
            );

            $extension_data['action'] = HTTPS_SERVER . 'index.php?route='.$modulesPath.'/magicslideshow' . $token;

            $extension_data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/'.$breadcrumbsPath . $token;

            if (isset($this->request->post['magicslideshow_status'])) {
                    $extension_data['magicslideshow_status'] = $this->request->post['magicslideshow_status'];
            }  else if (isset($this->request->post['magicslideshow_settings']['magicslideshow_status'])) {
		    $extension_data['magicslideshow_status'] = $this->request->post['magicslideshow_settings']['magicslideshow_status']; 
	    } else {
		    if (isset($this->params['magicslideshow_status'])) {
			$this->config->set('magicslideshow_status',$this->params['magicslideshow_status']);
		    } 
                    $extension_data['magicslideshow_status'] = $this->config->get('magicslideshow_status');
            }
            
            $extension_data['map'] = $this->map;
            
	    if (VERSION < 2) {
		foreach ($extension_data as $key => $value) {
		    $this->data[$key] = $value;
		}
		$this->template = $modulesPath.'/magicslideshow_oc15.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	    } else {
		foreach ($extension_data as $key => $value) {
		    $data[$key] = $value;
		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($modulesPath.'/magicslideshow_oc2.tpl', $data));
	    }
	    
            
    }

    private function validate() {
    
            global $modulesPath;
            
            if (!$this->user->hasPermission('modify', $modulesPath.'/magicslideshow')) {
                    $this->error['warning'] = $this->language->get('error_permission');
            }

            if (!$this->error) {
                    return TRUE;
            } else {
                    return FALSE;
            }
    }

    private function clearCache($path, $usedSubCache = null) {
        $files = glob($path.DIRECTORY_SEPARATOR.'*');
        if($files !== FALSE && !empty($files)) {
            foreach($files as $file) {
                if(is_dir($file)) {
                    if(!$usedSubCache || $usedSubCache != substr($file, strrpos($file, DIRECTORY_SEPARATOR)+1)) {
                        $this->clearCache($file);
                        @rmdir($file);
                    }
                } else {
                    @unlink($file);
                }
            }
        }
        return;
    }

    function MagicSlideshowgetCacheInfo($path, $usedSubCache = null) {

        $totalSize = 0;
        $totalCount = 0;
        $usedSize = 0;
        $usedCount = 0;
        if (is_dir($path))
        if ($handle = opendir($path)) {
            while (false !== ($file = readdir($handle))) {
                $next = $path . DIRECTORY_SEPARATOR . $file;
                if ($file != '.' && $file != '..' && !is_link($next)) {
                    if (is_dir($next)) {
                        $result = $this->MagicSlideshowgetCacheInfo($next);
                        if($file == $usedSubCache) {
                            $usedSize += $result['totalSize'];
                            $usedCount += $result['totalCount'];
                        }
                        $totalSize += $result['totalSize'];
                        $totalCount += $result['totalCount'];
                    } elseif (is_file($next)) {
                        $totalSize += filesize($next);
                        $totalCount++;
                    }
                }
            }
            closedir($handle);
        }
        return array('totalSize' => $totalSize, 'totalCount' => $totalCount, 'unusedSize' => $totalSize-$usedSize, 'unusedCount' => $totalCount-$usedCount);
    }

    function MagicSlideshowformat_size($size) {
        $units = array(' bytes', ' KB', ' MB', ' GB', ' TB');
        for ($i = 0; $size >= 1024 && $i < 4; $i++) $size /= 1024;
        return round($size, 2).$units[$i];
    }

}
?>