<?php

if (defined('HTTP_SERVER_TEMP')) {
    if (defined('JPATH_MIJOSHOP_OC')) {
	$path = HTTP_SERVER_TEMP.'components/com_mijoshop/opencart/admin/';
    } else {
	$path = HTTP_SERVER_TEMP.'components/com_aceshop/opencart/admin/';
    }
} else {
    if (defined('HTTP_SERVER')) {
        $path = HTTP_SERVER;
    } else {
        $path = '';
    }
}

if (!file_exists(DIR_APPLICATION.'/controller/module/')) { //newer than 2.2.x
    $modulesPath = 'extension/module';
} else {
    $modulesPath = 'module';
}

$path = preg_replace('/https?:/ims','',$path);

// Heading
$_['heading_title']    = '<img style="height:16px;vertical-align:-2px;" border="0px" src="'.$path.'controller/'.$modulesPath.'/magicslideshow-opencart-module/magicslideshow.png"><b>&nbsp;Magic Slideshow&trade;</b>';
$_['title']    	       = 'Magic Slideshow';

// Text
$_['text_module']      = 'Modules';
$_['text_success']     = 'Success: You have modified module Magic Slideshow!';
$_['entry_status']     = 'Module status';
$_['button_clear']     = 'Clear';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify module Magic Slideshow!';
?>