<?php echo $header; ?>
        
        <!-- start main-index -->

        <main class="main-contacts">

            <!-- start banner-under-header -->
            <!--<div class="container-fluid black-banner">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <p class="title-black-banner"><?php echo $heading_title; ?></p>
                            <ul class="bread-crumbs">
                            <?php			
                              $count = count($breadcrumbs);
                              $i=1;
                              foreach ($breadcrumbs as $breadcrumb) {
                                if($i!=$count){
                            ?>
                                  <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?></li>
                            <?php
                                }else{
                                  echo '<li><span> '.$breadcrumb['text'] . '</span></li>'; 
                                }		
                                $i++;
                              } 
                            ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>-->

            <!-- end banner-under-header -->

            <div class="container">
                <div class="row">
                    <div class="content-block">
                        <div class="col-md-12">
                            <?php echo $description; ?>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- start list-car -->

            <div class="container">
                <div class="row">
                    <div class="content-block" itemscope itemtype="http://schema.org/LocalBusiness">
                        <div class="col-md-6">
                            <p class="title-text">Головной офис в Ростове-на-Дону</p>
                            
                            <p itemscope itemtype="http://schema.org/PostalAddress">Адрес:</p>
                            <address><?php echo $address; ?></address>
                            <p><a href="<?php echo $email; ?>"><?php echo $email; ?></a></p>

                            <p class="sub-titile">Номера телефона:</p>
                            <p itemprop="telephone"><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></p>
                            <p itemprop="telephone"><a href="tel:<?php echo $mobile; ?>"><?php echo $mobile; ?></a></p>
                            <p itemprop="telephone">Viber: <a href="tel:<?php echo $fax; ?>"><?php echo $fax; ?></a></p>
                            
                            <p class="sub-titile">Мы в социальных сетях:</p>
                            <p><a href="#">Facebook</a> и <a href="https://vk.com/arenda_avto_rostov_na_donu">ВКонтакте</a></p>

                            <meta itemprop="priceRange" content="от 1600р./сутки до 6500р./сутки">

                            <p class="sub-titile">Часы работы:</p>
                            <?php echo $open; ?>
                        </div>
                        <div class="col-md-6">
                            <div class="facade-photo">
                                <img itemprop="image" src="catalog/view/theme/rentacenter/images/image-for-contact-page.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- start map-block -->

            <div class="container-fluid map-container">
                <div class="map-block">
                    <!--<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A634f38ccc436f06ed1cd4380c289ca8ea98d4b938bf5fea5f64856c8db4f5d7c&amp;width=100%25&amp;height=524&amp;lang=ru_RU&amp;scroll=false"></script>-->
                <div id="YMapsID" style="width:100%; height:524px"></div>
                <script src="https://api-maps.yandex.ru/2.0/?load=package.full&lang=ru-RU" type="text/javascript"></script>
                <script type="text/javascript">
                 
                    var myMap, myPlacemark, coords;
                 
                    ymaps.ready(init);
                 
                        function init () {
                 
                            //Определяем начальные параметры карты
                            myMap = new ymaps.Map('YMapsID', {
                                    center: [<?php if(!empty($geocode)){ ?><?php echo $geocode; ?><?php }else{ echo '56.326944, 44.0075'; } ?>], 
                                    zoom: 15
                                });	
                 
                            //Определяем элемент управления поиск по карте	
                            var SearchControl = new ymaps.control.SearchControl({noPlacemark:true});	
                 
                            //Добавляем элементы управления на карту
                             myMap.controls              
                                .add('zoomControl')                
                                .add('typeSelector')
                                
                            coords = [<?php if(!empty($geocode)){ ?><?php echo $geocode; ?><?php }else{ echo '56.326944, 44.0075'; } ?>];
                 
                            //Определяем метку и добавляем ее на карту				
                            myPlacemark = new ymaps.Placemark([<?php if(!empty($geocode)){ ?><?php echo $geocode; ?><?php }else{ echo '56.326944, 44.0075'; } ?>],{}, {preset: "twirl#redIcon", draggable: true});	
                 
                            myMap.geoObjects.add(myPlacemark);			
                    }
                </script>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block-form">
                                <div>
                                    <p class="title">Обратная связь
                                        <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                                    </p>
                                    <input type="text" id="name_contact_page" placeholder="Ваше Имя">
                                    <input type="text" id="tel_contact_page" placeholder="Ваш Номер Телефона">
                                    <input type="text" id="email_contact_page" placeholder="Ваш e-mail">
                                    <textarea id="question_contact_page" placeholder="Текст сообщения"></textarea>
                                    <input type="submit" onclick="sendFullForm();" class="button-yellow" value="Отправить сообщение">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end map-block -->
        </main>

<?php echo $footer; ?>