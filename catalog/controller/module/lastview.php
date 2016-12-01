<?php
class ControllerModuleLastview extends Controller {
    public function index($setting)
    {
        $this->load->language('module/lastview');
        $this->document->addScript("https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js");
        $this->document->addStyle("https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css");

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_tax'] = $this->language->get('text_tax');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['text_price'] = $this->language->get('text_price');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');
        if (isset($this->request->get['product_id'])) {
            $result = $this->model_catalog_product->getProduct($this->request->get['product_id']);
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
            if (isset($this->session->data['lastview'][$this->request->get['product_id']])) {
                unset($this->session->data['lastview'][$this->request->get['product_id']]);
            }
            $this->session->data['lastview'][$this->request->get['product_id']] = array(
                'product_id' => $result['product_id'],
                'image' => $result['image'],
                'name' => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                'price' => $price,
                'special' => $special,
                'tax' => $tax,
                'rating' => $rating,
                'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']),
            );
        }
        $data['products'] = array();
        if (isset($this->session->data['lastview'])) {
            $results = $this->session->data['lastview'];
            $results = array_reverse($results);
            $i = 0;
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = HTTP_SERVER.'image/'.$result['image'];
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', 0, 0);
                }
                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => $result['description'],
                    'price' => $result['price'],
                    'special' => $result['special'],
                    'tax' => $result['tax'],
                    'rating' => $result['rating'],
                    'href' => $result['href'],
                );
                $i++;
                if ($i == $setting['limit']) {
                    break;
                }
            }
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/lastview.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/lastview.tpl', $data);
            } else {
                return $this->load->view('default/template/module/lastview.tpl', $data);
            }
        }
    }
}