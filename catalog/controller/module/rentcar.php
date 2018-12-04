<?php
class ControllerModuleRentcar extends Controller {
	public function index($setting) {
		$this->load->language('module/rentcar');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['view_all'] = $this->url->link('product/category&path=59');
		$data['main_title'] = html_entity_decode($setting['module_rent_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
		$data['main_description'] = html_entity_decode($setting['module_rent_description'][$this->config->get('config_language_id')]['main_text'], ENT_QUOTES, 'UTF-8');
		$data['html'] = html_entity_decode($setting['module_rent_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');
		
		$data['mobile']  = isMobile;    /*мобильный агент*/
		$data['tablet']  = isTablet;    /*агент планшета*/
		$data['ios']     = isiOS;       /*агент ios*/
		$data['android'] = isAndroidOS; /*агент android*/
		$data['getbrowser'] = browser_detect; /*броузер ПК*/
		$data['getplatform'] = platform_detect; /*операционная система устройства*/
		
		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}
		
		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);
			
			
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);
				
				if ($product_info) {					
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], 240, 178);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', 240, 178);
					}

					if (($this->config->get('config_customer_price')) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
									
					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
						'option'	  => $this->model_catalog_product->getCarsOptions($product_id),
						'booking'     => $this->url->link('product/reservation', 'product_id=' . $product_info['product_id']),
					);
				}
			}
		}
		
		/*FILTER*/
		//price
		$data['price_from'] = explode(';', $setting['from_valute']);
		$data['price_to'] = explode(';', $setting['to_valute']);
		
		$this->load->model('catalog/ocfilter');
		
		$data['options'] = $this->model_catalog_ocfilter->getData();
		
		//Menu
		$this->load->model('catalog/category');
	
		$data['filter_categories'] = array();
		
		$filter_categories = $this->model_catalog_category->getCategoriesMainFilter();

		foreach ($filter_categories as $category) {
			// Level 1
			$data['filter_categories'][] = array(
				'name'     => $category['name'],
				'column'   => $category['column'] ? $category['column'] : 1,
				'href'     => $category['category_id']
			);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/rentcar.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/rentcar.tpl', $data);
		} else {
			return $this->load->view('default/template/module/rentcar.tpl', $data);
		}
	}
	
	public function totalPrice(){
		$json = array();
		
		$json = array(
			'status' => 0,
			'clear_price' => 0,
			'message' => ''
		);
		
		if (isset($this->request->post['product_id'])) {$product_id = $this->request->post['product_id']; if ($product_id == '') {unset($product_id);}}
		if (isset($this->request->post['change_price'])) {$change_price = $this->request->post['change_price']; if ($change_price == '') {unset($change_price);}}
		
		if (isset($product_id) && isset($change_price)){
			
			$this->load->model('catalog/product');
			
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$price = $product_info['price'];
				$clear_price = $price + $change_price;
				$total = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) + $change_price);
			}
		} else {
			$total = false;
		}
	
		$json = array(
			'status' => 1,
			'clear_price' => $clear_price,
			'message' => $total
		);
		
		return $json;
	}
	
	public function renderTotal(){
		$json = $this->totalPrice();
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function getRequest(){
		$json = array();
		
		if (isset($this->request->post['filter_categories'])) {
			$json['category_id'] = $this->request->post['filter_categories'];
		}else{
			$json['category_id'] = 0;
		}
				
		if (isset($this->request->post['price_from'])) {
			$json['price_from'] = $this->request->post['price_from'];
		}else{
			$json['price_from'] = 0;
		}
		
		if (isset($this->request->post['price_to'])) {
			$json['price_to'] = $this->request->post['price_to'];
		}else{
			$json['price_to'] = 0;
		}
		
		$this->load->model('catalog/ocfilter');
		
		$options = $this->model_catalog_ocfilter->getData();
		
		$json['options'] = array();
		
		if($options){
			foreach($options as $option){
				if(isset($this->request->post['option_' . $option['option_id']])) {
					$json['options'][] = $this->request->post["option_" . $option['option_id']];
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}