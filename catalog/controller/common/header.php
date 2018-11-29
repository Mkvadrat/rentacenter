<?php
class ControllerCommonHeader extends Controller {
	public function index() {
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
		// OCFilter start
		$data['noindex'] = $this->document->isNoindex();
		// OCFilter end
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
		//$data['og_url'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

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
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_contacts'] = $this->language->get('text_contacts');
		$data['text_services'] = $this->language->get('text_services');
		$data['text_conditions'] = $this->language->get('text_conditions');
		$data['text_rates'] = $this->language->get('text_rates');
		$data['text_cars'] = $this->language->get('text_cars');
		$data['text_cooperation'] = $this->language->get('text_cooperation');
		$data['text_contacts'] = $this->language->get('text_contacts');
		$data['text_news'] = $this->language->get('text_news');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
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
		$data['servises'] = $this->url->link('information/information&information_id=7');
		$data['conditions'] = $this->url->link('information/information&information_id=8');
		$data['rates'] = $this->url->link('information/information&information_id=9');
		$data['cars'] = $this->url->link('product/category&path=59');
		$data['auto_a'] = $this->url->link('product/product' . '&product_id=62');
		$data['auto_b'] = $this->url->link('product/product' . '&product_id=59');
		$data['auto_c'] = $this->url->link('product/product' . '&product_id=52');
		$data['auto_d'] = $this->url->link('product/product' . '&product_id=64');
		$data['auto_e'] = $this->url->link('product/product' . '&product_id=55');
		$data['auto_f'] = $this->url->link('product/product' . '&product_id=51');
		$data['auto_g'] = $this->url->link('product/product' . '&product_id=54');
		$data['auto_h'] = $this->url->link('product/product' . '&product_id=63');
		$data['auto_i'] = $this->url->link('product/product' . '&product_id=69');
		$data['auto_k'] = $this->url->link('product/product' . '&product_id=70');
		$data['auto_l'] = $this->url->link('product/product' . '&product_id=68');
		$data['auto_m'] = $this->url->link('product/product' . '&product_id=50');
		$data['auto_n'] = $this->url->link('product/product' . '&product_id=66');
		$data['auto_o'] = $this->url->link('product/product' . '&product_id=53');
		$data['auto_p'] = $this->url->link('product/product' . '&product_id=65');
		$data['auto_r'] = $this->url->link('product/product' . '&product_id=56');
		$data['auto_s'] = $this->url->link('product/product' . '&product_id=67');
		$data['auto_t'] = $this->url->link('product/product' . '&product_id=58');
		$data['auto_u'] = $this->url->link('product/product' . '&product_id=57');
		$data['auto_v'] = $this->url->link('product/product' . '&product_id=60');
		$data['auto_w'] = $this->url->link('product/product' . '&product_id=61');
		$data['cooperation'] = $this->url->link('information/information&information_id=10');
		$data['news'] = $this->url->link('information/news');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['mobile'] = $this->config->get('config_mobile_telephone');
		$data['fax'] = $this->config->get('config_fax');
		$data['comment'] = utf8_substr(html_entity_decode($this->config->get('config_comment'), ENT_QUOTES, 'UTF-8'), 0, 300);
		$data['booking'] = $this->url->link('product/reservation', 'product_id=0', 'SSL');
		$data['without_driver'] = $this->url->link('information/information&information_id=11');
		$data['rental_airport'] = $this->url->link('information/information&information_id=12');
		$data['reviews_guest'] = $this->url->link('testimonial/testimonial');

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
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}
