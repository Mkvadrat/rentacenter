<?php
class ControllerProductReservation extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('product/reservation');
		
		$this->load->model('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if(isset($this->request->get['product_id'])){
			$data['product_id'] = $this->request->get['product_id'];
		}else{
			$data['product_id'] = 0;
		}
		
		if(isset($this->request->get['product_id'])){
			$product_id = $this->request->get['product_id'];
		}else{
			$product_id = 0;
		}
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			
			//Бронирование автомобиля
			if (isset($this->request->post['auto_id'])) {
				$auto_name_result = $this->model_catalog_product->getNameCar($this->request->post['auto_id']);
				$auto_price_result = $this->model_catalog_product->getPriceCar($this->request->post['auto_id']);
				$auto_name = $auto_name_result['name'];
				$auto_price = $this->currency->format($this->tax->calculate($auto_price_result['price'], '0', $this->config->get('config_tax')));
			}else{
				$auto_name = 'Марка машины не выбрана!';
				$auto_price = 'Стоимость не известна';
			}
			
			if (isset($this->request->post['date_from'])) {
				$date_from = $this->request->post['date_from'];
			}else{
				$date_from = '';
			}
			
			if (isset($this->request->post['time_from'])) {
				$time_from = $this->request->post['time_from'];
			}else{
				$time_from = '';
			}
			
			if (isset($this->request->post['date_before'])) {
				$date_before = $this->request->post['date_before'];
			}else{
				$date_before = '';
			}
			
			if (isset($this->request->post['time_before'])) {
				$time_before = $this->request->post['time_before'];
			}else{
				$time_before = '';
			}
			
			if (isset($this->request->post['surname'])) {
				$surname = $this->request->post['surname'];
			}else{
				$surname = '';
			}
			
			if (isset($this->request->post['name'])) {
				$name = $this->request->post['name'];
			}else{
				$name = '';
			}
			
			if (isset($this->request->post['patronymic'])) {
				$patronymic = $this->request->post['patronymic'];
			}else{
				$patronymic = '';
			}
			
			if (isset($this->request->post['born'])) {
				$born = $this->request->post['born'];
			}else{
				$born = '';
			}
			
			if (isset($this->request->post['phone'])) {
				$phone = $this->request->post['phone'];
			}else{
				$phone = '';
			}
			
			//Паспорт
			if (isset($this->request->post['serial'])) {
				$serial = $this->request->post['serial'];
			}else{
				$serial = '';
			}
			
			if (isset($this->request->post['issue_date'])) {
				$issue_date = $this->request->post['issue_date'];
			}else{
				$issue_date = '';
			}
			
			if (isset($this->request->post['issued_by'])) {
				$issued_by = $this->request->post['issued_by'];
			}else{
				$issued_by = '';
			}
			
			if (isset($this->request->post['registration'])) {
				$registration = $this->request->post['registration'];
			}else{
				$registration = '';
			}
			
			if (isset($this->request->post['address'])) {
				$address = $this->request->post['address'];
			}else{
				$address = '';
			}
			
			if (isset($this->request->post['license'])) {
				$license = $this->request->post['license'];
			}else{
				$license = '';
			}
			
			if (isset($this->request->post['license_issued_by'])) {
				$license_issued_by = $this->request->post['license_issued_by'];
			}else{
				$license_issued_by = '';
			}
			
			//Дополнительная информация
			/*if (isset($this->request->post['city'])) {
				$city = $this->request->post['city'];
			}else{
				$city = '';
			}*/
			
			if (isset($this->request->post['add_phone'])) {
				$add_phone = $this->request->post['add_phone'];
			}else{
				$add_phone = '';
			}
			
			if (isset($this->request->post['email'])) {
				$email = $this->request->post['email'];
			}else{
				$email = '';
			}
			
			if (isset($this->request->post['issue_place'])) {
				$issue_place = $this->request->post['issue_place'];
			}else{
				$issue_place = '';
			}
			
			if (isset($this->request->post['i_take']) == 1) {
				$i_take = 'Да';
			}else{
				$i_take = 'Нет';
			}
			
			//Дополнительные услуги
			if (isset($this->request->post['baby_chair']) == 1) {
				$baby_chair = 'Да';
			}else{
				$baby_chair = 'Нет';
			}
			
			if (isset($this->request->post['dvr']) == 1) {
				$dvr = 'Да';
			}else{
				$dvr = 'Нет';
			}
			
			if (isset($this->request->post['unlimited_mileage']) == 1) {
				$unlimited_mileage = 'Да';
			}else{
				$unlimited_mileage = 'Нет';
			}
			
			if (isset($this->request->post['insurance']) == 1) {
				$insurance = 'Да';
			}else{
				$insurance = 'Нет';
			}
			
			if (isset($this->request->post['wifi']) == 1) {
				$wifi = 'Да';
			}else{
				$wifi = 'Нет';
			}
			
			if (isset($this->request->post['callback_auto']) == 1) {
				$callback_auto = 'Да';
			}else{
				$callback_auto = 'Нет';
			}
			
			if (isset($this->request->post['additional_driver']) == 1) {
				$additional_driver = 'Да';
			}else{
				$additional_driver = 'Нет';
			}
			
			if (isset($this->request->post['gps']) == 1) {
				$gps = 'Да';
			}else{
				$gps = 'Нет';
			}
			
			if (isset($this->request->post['radar']) == 1) {
				$radar = 'Да';
			}else{
				$radar = 'Нет';
			}

			//<p><strong>Место рождения: '.$city.'</strong></p>
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($surname.' '.$name, ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf('Аренда автомобиля', $surname.' '.$name), ENT_QUOTES, 'UTF-8'));
			$mail->setHtml(
			
			'<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
			<meta name="viewport" content="width=device-width" />
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<title>ZURBemails</title>
			<style>
			img {
			max-width: 100%;
			}
			.collapse {
			margin:0;
			padding:0;
			}
			body {
			-webkit-font-smoothing:antialiased;
			-webkit-text-size-adjust:none;
			width: 100%!important;
			height: 100%;
			}
	
			a { color: #2BA6CB;}
	
			.btn {
			text-decoration:none;
			color: #FFF;
			background-color: #666;
			padding:10px 16px;
			font-weight:bold;
			margin-right:10px;
			text-align:center;
			cursor:pointer;
			display: inline-block;
			}
	
			p.callout {
			padding:15px;
			background-color:#ECF8FF;
			margin-bottom: 15px;
			}
			.callout a {
			font-weight:bold;
			color: #2BA6CB;
			}
	
			table.social {
			background-color: #ebebeb;
	
			}
			.social .soc-btn {
			padding: 3px 7px;
			font-size:12px;
			margin-bottom:10px;
			text-decoration:none;
			color: #FFF;font-weight:bold;
			display:block;
			text-align:center;
			}
			a.fb { background-color: #3B5998!important; }
			a.tw { background-color: #1daced!important; }
			a.gp { background-color: #DB4A39!important; }
			a.ms { background-color: #000!important; }
	
			.sidebar .soc-btn {
			display:block;
			width:100%;
			}
	
			table.head-wrap { width: 100%;}
	
			.header.container table td.logo { padding: 15px; }
			.header.container table td.label { padding: 15px; padding-left:0px;}
	
			table.body-wrap { width: 100%;}
	
			table.footer-wrap { width: 100%;	clear:both!important;
			}
			.footer-wrap .container td.content  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}
			.footer-wrap .container td.content p {
			font-size:10px;
			font-weight: bold;
	
			}
	
			h1,h2,h3,h4,h5,h6 {
			font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;
			}
			h1 small, h2 small, h3 small, h4 small, h5 small, h6 small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }
	
			h1 { font-weight:200; font-size: 44px;}
			h2 { font-weight:200; font-size: 37px;}
			h3 { font-weight:500; font-size: 27px;}
			h4 { font-weight:500; font-size: 23px;}
			h5 { font-weight:900; font-size: 17px;}
			h6 { font-weight:900; font-size: 14px; text-transform: uppercase; color:#ffffff;}
	
			.collapse { margin:0!important;}
	
			p, ul {
			font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
			margin-bottom: 10px;
			font-weight: normal;
			font-size:14px;
			line-height:1.6;
			}
			p.lead { font-size:17px; }
			p.last { margin-bottom:0px;}
	
			ul li {
			font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
			margin-left:5px;
			list-style-position: inside;
			}
	
			ul.sidebar {
			font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
			background:#ebebeb;
			display:block;
			list-style-type: none;
			}
			ul.sidebar li { display: block; margin:0;}
			ul.sidebar li a {
			text-decoration:none;
			color: #666;
			padding:10px 16px;
			margin-right:10px;
			cursor:pointer;
			border-bottom: 1px solid #777777;
			border-top: 1px solid #FFFFFF;
			display:block;
			margin:0;
			}
			ul.sidebar li a.last { border-bottom-width:0px;}
			ul.sidebar li a h1,ul.sidebar li a h2,ul.sidebar li a h3,ul.sidebar li a h4,ul.sidebar li a h5,ul.sidebar li a h6,ul.sidebar li a p { margin-bottom:0!important;}
	
			.container {
			font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
			display:block!important;
			max-width:600px!important;
			margin:0 auto!important;
			clear:both!important;
			}
	
			.content {
			padding:15px;
			max-width:600px;
			margin:0 auto;
			display:block;
			}
	
			.content table { width: 100%; }
	
			.column {
			width: 300px;
			float:left;
			}
			.column tr td { padding: 15px; }
			.column-wrap {
			padding:0!important;
			margin:0 auto;
			max-width:600px!important;
			}
			.column table { width:100%;}
			.social .column {
			width: 280px;
			min-width: 279px;
			float:left;
			}
	
	
			.clear { display: block; clear: both; }
	
			@media only screen and (max-width: 600px) {
	
			a[class="btn"] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}
	
			div[class="column"] { width: auto!important; float:none!important;}
	
			table.social div[class="column"] {
			width:auto!important;
			}
	
			}
			</style>
	
			</head>
	
			<body bgcolor="#FFFFFF">
	
			<!-- HEADER -->
			<table class="head-wrap" bgcolor="#003576">
			<tr>
			<td></td>
			<td class="header container" >
	
			<div class="content">
			<table>
			<tr>
	
			<td align="left"><h6 class="collapse" style="font-weight: 900; font-size: 14px; text-transform: uppercase; color: #ffffff;">AVTO PROKAT РОСТОВ-НА-ДОНУ</h6></td>
			<td align="right"><h6 class="collapse" style="font-weight: 900; font-size: 14px; text-transform: uppercase; color: #ffffff;">Обратная связь</h6></td>
			</tr>
			</table>
			</div>
	
			</td>
			<td></td>
			</tr>
			</table>
	
			<table class="body-wrap">
			<tr>
			<td></td>
			<td class="container" bgcolor="#FFFFFF">
	
			<div class="content">
			<table>
			<tr>
			<td>
			<h3>Бронирование автомобиля</h3>
			<p><strong>Автомобиль: '.$auto_name.'</strong></p>
			<p><strong>Стоимость от: '.$auto_price.'</strong></p>
			<p><strong>Срок аренды, c: '.$date_from.' '.$time_from.' по '.$date_before.' '.$time_before.'</strong></p>
			<p><strong>Фамилия: '.$surname.'</strong></p>
			<p><strong>Имя: '.$name.'</strong></p>
			<p><strong>Отчество: '.$patronymic.'</strong></p>
			<p><strong>Дата рождения: '.$born.'</strong></p>
			<p><strong>Основной номер телефона: '.$phone.'</strong></p>

			<h3>Паспорт</h3>
			<p><strong>Серия и номер: '.$serial.'</strong></p>
			<p><strong>Дата выдачи: '.$issue_date.'</strong></p>
			<p><strong>Кем выдан: '.$issued_by.'</strong></p>
			<p><strong>Адрес регистрации: '.$registration.'</strong></p>
			<p><strong>Фактический адрес прожимания: '.$address.'</strong></p>
			
			<h3>Водительские права</h3>
			<p><strong>Серия и номер: '.$license.'</strong></p>
			<p><strong>Дата выдачи: '.$license_issued_by.'</strong></p>
			
			<h3>Дополнительная информация</h3>
			<p><strong>Место подачи авто: '.$issue_place.'</strong></p>
			<p><strong>Дополнительный телефон: '.$add_phone.'</strong></p>
			<p><strong>E-mail: '.$email.'</strong></p>
			<p><strong>Самостоятельно заберу - '.$i_take.'</strong></p>
			
			<h3>Дополнительные услуги </h3>
			<p><strong>Детское кресло (200 р.) - '.$baby_chair.'</strong></p>
			<p><strong>Видеорегистратор (300 р.) - '.$dvr.'</strong></p>
			<p><strong>Безлимитный пробег (1500 р.) - '.$unlimited_mileage.'</strong></p>
			<p><strong>Страховка любого стекла и колес (1000 р.) - '.$insurance.'</strong></p>
			
			<p><strong>WIFI в Автомобиле (300 р.) - '.$wifi.'</strong></p>
			<p><strong>Возврат автомобиля (500 р.) - '.$callback_auto.'</strong></p>
			
			<p><strong>Дополнительный водитель (500 р.) - '.$additional_driver.'</strong></p>
			<p><strong>GPS навигатор (100 р.) - '.$gps.'</strong></p>
			
			<p><strong>Детектор радаров (300 р.) - '.$radar.'</strong></p>
			
			<!-- Callout Panel -->
			<!-- social & contact -->
			<table class="social" width="100%">
			<tr>
			<td>
			<table align="left" class="column">
			<tr>
			<td>
	
			<h5 class="">Контактная информация:</h5>
			<br/>
			<p>Ф.И.О: <strong>'.$surname.' '.$name.' '.$patronymic.'</strong></p>
			<p>Email: <strong><a href="emailto: '.$email.'">'.$email.'</a></strong></p>
			<p>Телефон: <strong>'.$phone.'</strong></p>
			</td>
			</tr>
			</table>
	
			<span class="clear"></span>
	
			</td>
			</tr>
			</table>
	
			</td>
			</tr>
			</table>
			</div>
	
			</td>
			<td></td>
			</tr>
			</table>
	
			<table class="footer-wrap">
			<tr>
			<td></td>
			<td class="container"></td>
			<td></td>
			</tr>
			</table>
	
			</body>
			</html>'
			
			);
			
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
		
		$data['action'] = $this->url->link('product/reservation', 'product_id='.$product_id, 'SSL');
		
		$data['info']  = array();
		
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
		
		/*if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}*/
		
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
		
		if (preg_match('/^\d\d\/\d\d\/\d\d\d\d$/', $this->request->post['date_from'])) {
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
		
		/*if ((utf8_strlen($this->request->post['city']) < 3) || (utf8_strlen($this->request->post['city']) > 32)) {
			$this->error['city'] = $this->language->get('Город должен содержать не менее 3 символов!');
		}*/
		
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
