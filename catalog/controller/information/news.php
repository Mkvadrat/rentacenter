<?php
class ControllerInformationNews extends Controller {
	public function index() {
		$this->language->load('information/news');
		
		$this->load->model('extension/news');
	 
		$this->document->setTitle($this->language->get('heading_title')); 
	 
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text' 		=> 'Главная',
			'href' 		=> $this->url->link('common/home'),
			'separator' => $this->language->get('text_separator')
		);
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('heading_title'),
			'href' 		=> $this->url->link('information/news'),
			'separator' => $this->language->get('text_separator')
		);
		  
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$filter_data = array(
			'page' 	=> $page,
			'limit' => 5,
			'start' => 5 * ($page - 1),
		);
		
		$total = $this->model_extension_news->getTotalNews();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('information/news', 'page={page}');
		
		$data['pagination'] = $pagination->render();
	 
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($total - 5)) ? $total : ((($page - 1) * 5) + 5), $total, ceil($total / 5));

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_title'] = $this->language->get('text_title');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_view'] = $this->language->get('text_view');
	 
		$all_news = $this->model_extension_news->getAllNews($filter_data);
	 
		$data['all_news'] = array();
		
		$this->load->model('tool/image');
	 
		foreach ($all_news as $news) {
			$data['all_news'][] = array (
				'title' 		=> $news['title'],
				'image'			=> $this->model_tool_image->resize($news['image'], 737, 381),
				'description' 	=> utf8_substr(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '..',
				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added']))
			);
		}
		
		$data['related_news'] = array();
		
		$related_news = $this->model_extension_news->getRalatedNews();
		
		foreach ($related_news as $news) {
			$data['related_news'][] = array (
				'title' 		=> $news['title'],
				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added']))
			);
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/news_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/news_list.tpl', $data));
		}
	}
 
	public function news() {
		$this->load->model('extension/news');
	  
		$this->language->load('information/news');
 
		if (isset($this->request->get['news_id']) && !empty($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}
 
		$news = $this->model_extension_news->getNews($news_id);
 
		$data['breadcrumbs'] = array();
	  
		$data['breadcrumbs'][] = array(
			'text' 			=> 'Главная',
			'href' 			=> $this->url->link('common/home'),
			'separator' => $this->language->get('text_separator')
		);
	  
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/news'),
			'separator' => $this->language->get('text_separator')
		);
 
		if ($news) {
			$data['breadcrumbs'][] = array(
				'text' 		=> $news['title'],
				'href' 		=> $this->url->link('information/news/news', 'news_id=' . $news_id),
				'separator' => $this->language->get('text_separator')
			);
 
			$this->document->setTitle($news['title']);
			
			$this->load->model('tool/image');
			
			$data['image'] = $this->model_tool_image->resize($news['image'], 200, 200);
 
			$data['heading_title'] = $news['title'];
			$data['description'] = html_entity_decode($news['description']);
			$data['date_added'] = date('d.m.Y', strtotime($news['date_added']));
			
			$data['related_news'] = array();
		
			$related_news = $this->model_extension_news->getRalatedNews();
			
			foreach ($related_news as $news) {
				$data['related_news'][] = array (
					'title' 		=> $news['title'],
					'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
					'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added']))
				);
			}
	 
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/news.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/news.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' 		=> $this->language->get('text_error'),
				'href' 		=> $this->url->link('information/news', 'news_id=' . $news_id),
				'separator' => $this->language->get('text_separator')
			);
	 
			$this->document->setTitle($this->language->get('text_error'));
	 
			$data['heading_title'] = $this->language->get('text_error');
			$data['text_error'] = $this->language->get('text_error');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');
	 
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}
}