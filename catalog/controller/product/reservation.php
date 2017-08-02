<?php
class ControllerProductReservation extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('product/reservation');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->request->post['email']);
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			$mail->setText($this->request->post['enquiry']);
			$mail->send();

			$this->response->redirect($this->url->link('information/contact/success'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
			'separator' => $this->language->get('text_separator')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/reservation'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['action'] = $this->url->link('product/reservation', '', 'SSL');
		
		$data['info']  = array();
		
		if(isset($this->request->get['product_id'])){
			$data['product_id'] = $this->request->get['product_id'];
		}else{
			$data['product_id'] = 0;
		}
	
		$this->load->model('catalog/product');

		$results = $this->model_catalog_product->getProducts();
		
		foreach ($results as $result) {
			
			if (($this->config->get('config_customer_price')) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
						
			$transmission_result = $this->model_catalog_product->getTransmissionValue($result['product_id']);
			
			if($transmission_result){
				$transmission = $transmission_result['name'];
			}else{
				$transmission = '';
			}
			
			$data['info'][] = array(
					'product_id' => $result['product_id'],
					'name'  	 => $result['name'],
					'price'	     => $price,
					'option'     => $transmission
			);	
		}
		

		
		if (isset($this->error['date_from'])) {
			$data['error_date_from'] = $this->error['date_from'];
		} else {
			$data['error_date_from'] = '';
		}
		
		if (isset($this->error['time_from'])) {
			$data['error_time_from'] = $this->error['time_from'];
		} else {
			$data['error_time_from'] = '';
		}
		
		if (isset($this->error['date_before'])) {
			$data['error_date_before'] = $this->error['date_before'];
		} else {
			$data['error_date_before'] = '';
		}
		
		if (isset($this->error['time_before'])) {
			$data['error_time_before'] = $this->error['time_before'];
		} else {
			$data['error_time_before'] = '';
		}
		
		if (isset($this->error['surname'])) {
			$data['error_surname'] = $this->error['surname'];
		} else {
			$data['error_surname'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['patronymic'])) {
			$data['error_patronymic'] = $this->error['patronymic'];
		} else {
			$data['error_patronymic'] = '';
		}
		
		if (isset($this->error['born'])) {
			$data['error_born'] = $this->error['born'];
		} else {
			$data['error_born'] = '';
		}
		
		if (isset($this->error['phone'])) {
			$data['error_phone'] = $this->error['phone'];
		} else {
			$data['error_phone'] = '';
		}
		
		if (isset($this->error['serial'])) {
			$data['error_serial'] = $this->error['serial'];
		} else {
			$data['error_serial'] = '';
		}
		
		if (isset($this->error['issue_date'])) {
			$data['error_issue_date'] = $this->error['issue_date'];
		} else {
			$data['error_issue_date'] = '';
		}
		
		if (isset($this->error['issued_by'])) {
			$data['error_issued_by'] = $this->error['issued_by'];
		} else {
			$data['error_issued_by'] = '';
		}
		
		if (isset($this->error['registration'])) {
			$data['error_registration'] = $this->error['registration'];
		} else {
			$data['error_registration'] = '';
		}
		
		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = '';
		}
		
		if (isset($this->error['license'])) {
			$data['error_license'] = $this->error['license'];
		} else {
			$data['error_license'] = '';
		}
		
		if (isset($this->error['license_issued_by'])) {
			$data['error_license_issued_by'] = $this->error['license_issued_by'];
		} else {
			$data['error_license_issued_by'] = '';
		}
		
		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}
		
		if (isset($this->error['issue_place'])) {
			$data['error_issue_place'] = $this->error['issue_place'];
		} else {
			$data['error_issue_place'] = '';
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/reservation.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/reservation.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/reservation.tpl', $data));
		}
		
	}
	
	protected function validate() {
		
		if (preg_match('~^\\d{1,2}\\.\\d{1,2}\\.\\d{4}$~', $this->request->post['date_from'])) {
			$this->error['date_from'] = $this->language->get('Дата введена не верно!');
		}
		
		if (preg_match('/^([01]?[0-9]|2[0-3])(:|\.)[0-5][0-9]$/', $this->request->post['time_from'])) {
			$this->error['time_from'] = $this->language->get('Время введено не верно!');
		}
		
		if (preg_match('~^\\d{1,2}\\.\\d{1,2}\\.\\d{4}$~', $this->request->post['date_before'])) {
			$this->error['date_before'] = $this->language->get('Дата введена не верно!');
		}
		
		if (preg_match('/^([01]?[0-9]|2[0-3])(:|\.)[0-5][0-9]$/', $this->request->post['time_before'])) {
			$this->error['time_before'] = $this->language->get('Время введено не верно!');
		}
		
		if ((utf8_strlen($this->request->post['surname']) < 3) || (utf8_strlen($this->request->post['surname']) > 32)) {
			$this->error['surname'] = $this->language->get('Фамилия должна содержать не менее 3 символов!');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('Имя должно содержать не менее 3 символов!');
		}
		
		if ((utf8_strlen($this->request->post['patronymic']) < 3) || (utf8_strlen($this->request->post['patronymic']) > 32)) {
			$this->error['patronymic'] = $this->language->get('Отчество должно содержать не менее 3 символов!');
		}
		
		if (preg_match('~^\\d{1,2}\\.\\d{1,2}\\.\\d{4}$~', $this->request->post['born'])) {
			$this->error['born'] = $this->language->get('Дата рождения введена не верно!');
		}
		
		if ((utf8_strlen($this->request->post['phone']) < 8) || (utf8_strlen($this->request->post['phone']) > 32)) {
			$this->error['phone'] = $this->language->get('Телефон должен содержать не менее 8 символов!');
		}
		
		if ((utf8_strlen($this->request->post['serial']) < 8) || (utf8_strlen($this->request->post['serial']) > 32)) {
			$this->error['serial'] = $this->language->get('Серия и номер паспорта должны содержать не менее 8 символов!');
		}
		
		if (preg_match('~^\\d{1,2}\\.\\d{1,2}\\.\\d{4}$~', $this->request->post['issue_date'])) {
			$this->error['issue_date'] = $this->language->get('Дата введена не верно!');
		}
		
		if ((utf8_strlen($this->request->post['issued_by']) < 3) || (utf8_strlen($this->request->post['issued_by']) > 32)) {
			$this->error['issued_by'] = $this->language->get('Поле должно содержать не менее 3 символов!');
		}

		if ((utf8_strlen($this->request->post['registration']) < 3) || (utf8_strlen($this->request->post['registration']) > 32)) {
			$this->error['registration'] = $this->language->get('Адрес регистрации должнен содержать не менее 3 символов!');
		}
		
		if ((utf8_strlen($this->request->post['address']) < 3) || (utf8_strlen($this->request->post['address']) > 32)) {
			$this->error['address'] = $this->language->get('Фактический адрес проживания должнен содержать не менее 3 символов!');
		}
		
		if ((utf8_strlen($this->request->post['license']) < 3) || (utf8_strlen($this->request->post['license']) > 32)) {
			$this->error['license'] = $this->language->get('Лицензия должна содержать не менее 3 символов!');
		}
		
		if (preg_match('~^\\d{1,2}\\.\\d{1,2}\\.\\d{4}$~', $this->request->post['license_issued_by'])) {
			$this->error['license_issued_by'] = $this->language->get('Дата введена не верно!');
		}
		
		if ((utf8_strlen($this->request->post['city']) < 3) || (utf8_strlen($this->request->post['city']) > 32)) {
			$this->error['city'] = $this->language->get('Город должен содержать не менее 3 символов!');
		}
		
		if ((utf8_strlen($this->request->post['issue_place']) < 3) || (utf8_strlen($this->request->post['issue_place']) > 32)) {
			$this->error['issue_place'] = $this->language->get('Место подачи авто должно содержать не менее 3 символов!');
		}
		
		return !$this->error;
	}
	
	public function success() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
			'separator' => $this->language->get('text_separator')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}
}
