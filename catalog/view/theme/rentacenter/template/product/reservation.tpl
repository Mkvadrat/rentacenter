<?php echo $header; ?>

        <!-- start main-index -->

    <main class="main-reservation">

        <!-- start banner-under-header -->

        <div class="container-fluid black-banner">
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
        </div>

        <!-- end banner-under-header -->

        <!-- start list-car -->

        <div class="container">
            <div class="row">
                <div class="content-block">
                    <div class="col-md-12 pad-left pad-right">
                        <div class="text-block">
                            <p class="title-text">Заявка на аренду автомобиля</p>
                            <p>Заполните полную форму и мы подготовим все документы заранее!<br>
                                <em>*</em> - обязательные поля для заполнения
                            </p>
                        </div>
                    </div>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <div class="col-md-6 pad-left">
                            <p class="form-title">
                                <span>1</span> Бронирование автомобиля
                            </p>
                                <div class="first-form">
                                <p>
                                    <em>*</em>Автомобиль: 
                                    <select name="auto_id">
                                        <?php foreach($info as $mobile){ ?>
                                        <?php if($product_id == $mobile['product_id']){ ?>
                                        <option value="<?php echo $mobile['product_id']; ?>" selected="selected"><?php echo $mobile['name']; ?>, <?php echo !empty($mobile['option']) ? 'кпп ' . $mobile['option'] : 'кпп не известно'; ?><?php echo ' - от ' . $mobile['price']; ?></option>
                                        <?php }else{ ?>
                                        <option value="<?php echo $mobile['product_id']; ?>"><?php echo $mobile['name']; ?>, <?php echo !empty($mobile['option']) ? 'кпп ' . $mobile['option'] : 'кпп не известно'; ?><?php echo ' - от ' . $mobile['price']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </p>
                                <label class="from"><em>*</em>Срок аренды, c
                                    <input type="date" name="date_from" placeholder="01.01.2017" value="" >

                                    <input type="time" name="time_from" placeholder="12:00" value="">

                                </label>
                                <label class="to">по 
                                    <input type="date" name="date_before" placeholder="01.01.2017" value="">

                                    <input type="time" name="time_before" placeholder="12:00" value="">

                                </label>
                                <label class="surname"><em>*</em>Фамилия:<input type="text" name="surname" placeholder="Фамилия" value=""></label>

                                <label class="name"><em>*</em>Имя: <input type="text" name="name" placeholder="Имя:" value=""></label>

                                <label class="patronymic"><em>*</em>Отчество:<input type="text" name="patronymic" placeholder="Отчество" value=""></label>

                                <label class="birthday"><em>*</em>Дата рождения: <input type="date" name="born" placeholder="01.01.2017" value=""></label>
                            
                                <label class="primary-phone"><em>*</em>Основной номер телефона: <input type="tel" name="phone" placeholder="+7 (123) 456 78 9" value=""></label>
                            </div>
                        </div>
                        <div class="col-md-6 pad-right">
                            <p class="form-title form-title-pasport">
                                Паспорт
                            </p>
                            <div class="pasport-form">
                                <label class="number"><em>*</em>Серия и номер:<input type="text" name="serial" placeholder="Серия и номер" value=""></label>

                                <label class="date"><em>*</em>Дата выдачи:<input type="date" name="issue_date" placeholder="01.01.2017" value=""></label>
                               

                                <label class="issued"><em>*</em>Кем выдан: <input type="text" name="issued_by" placeholder="123456789" value=""></label>

                                <label class="address"><em>*</em>Адрес регистрации: <input type="text" name="registration" placeholder="123456789" value=""></label>

                                <label class="address-fact"><em>*</em>Фактический адрес прожимания: <input type="text" name="address" placeholder="123456789" value=""></label>

                                <p class="form-title form-title-pasport">
                                Водительские права
                                </p>
                                <label class="number"><em>*</em>Серия и номер:<input type="text" name="license" placeholder="123456789" value=""></label>

                                <label class="date"><em>*</em>Дата выдачи:<input type="date" name="license_issued_by" placeholder="01.01.2017" value=""></label>
                               
                            </div>
                        </div>
    
                        <div class="col-md-12 pad-left pad-right">
                            <p class="form-title">
                                <span>2</span> Дополнительная информация
                            </p>
                            <div class="more-info-form">
                                <label class="place-birth"><em>*</em>Место рождения: <input type="text" name="city" placeholder="г. Ростов-на-Дону" value=""></label>

                                <label class="add-phone">Дополнительный телефон: <input type="text" name="add_phone" placeholder="+7 (123) 456 78 9" value=""></label>
                                <label class="mail">E-mail: <input type="email" name="email" placeholder="Введите Ваш  e-mail" value=""></label>

                                <label class="car-supply"><em>*</em>Место подачи авто: <input type="text" name="issue_place" placeholder="г. Ростов-на-Дону" value=""></label>

                                <div class="i-take-block">
                                    <input id="i-take" type="checkbox" name="i_take" value="1">
                                    <label for="i-take">Самостоятельно заберу</label>
                                </div>
                            </div>
                        </div>
    
                        <div class="col-md-12 pad-left pad-right">
                            <p class="form-title">
                                <span>3</span> Дополнительные услуги
                            </p>
                            <div class="add-services-form">
                            <div class="column">
                                <div class="more-info">
                                    <input id="baby-chair" type="checkbox" name="baby_chair"  value="1">
                                    <label for="baby-chair">Детское кресло (200 р.)</label>

                                    <input id="DVR" type="checkbox" name="dvr"  value="1">
                                    <label for="DVR">Видеорегистратор (300 р.)</label>

                                    <input id="unlimited-mileage" type="checkbox" name="unlimited_mileage" value="1">
                                    <label for="unlimited-mileage">Безлимитный пробег (1500 р.)</label>

                                    <input id="insurance" type="checkbox" name="insurance"  value="1">
                                    <label for="insurance">Страховка любого стекла и колес (1000 р.)</label>
                                </div>
                            </div>
                            <div class="column">
                                <div class="more-info">
                                    <input id="WIFI" type="checkbox" name="wifi"  value="1">
                                    <label for="WIFI">WIFI в Автомобиле (300 р.)</label>

                                    <input id="return-car" type="checkbox" name="callback_auto"  value="1">
                                    <label for="return-car">Возврат автомобиля (500 р.)</label>
                                </div>
                            </div>
                            <div class="column">
                                <div class="more-info">
                                    <input id="add-driver" type="checkbox" name="additional_driver"  value="1">
                                    <label for="add-driver">Дополнительный водитель (500 р.)</label>

                                    <input id="GPS" type="checkbox" name="gps"  value="1">
                                    <label for="GPS">GPS навигатор (100 р.)</label>
                                </div>
                            </div>
                            <div class="column">
                                <div class="more-info">
                                    <input id="detector-radars" type="checkbox" name="radar"  value="1">
                                    <label for="detector-radars">Детектор радаров (300 р.)</label>
                                </div>
                            </div>
                        </div>
                        </div>
    
                        <div class="col-md-12 pad-left pad-right">
                                <input class="button-yellow" type="submit" value="Забронировать авто">
                                <p>*После заполнения всех полей, Вам на почту придет сообщение с просчетом<br>стоимости аренды автомобиля на указанный срок</p>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- end list-car -->

    </main>

    <!-- end main-index -->

<?php echo $footer; ?>
