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
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="first-form">
                        <div class="col-md-6 pad-left">
                            <p class="form-title">
                                <span>1</span> Бронирование автомобиля
                            </p>
                            
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
                                    <?php if ($error_date_from) { ?>
                                    <div class="text-danger"><?php echo $error_date_from; ?></div>
                                    <?php } ?>
                                    <input type="time" name="time_from" placeholder="12:00" value="">
                                    <?php if ($error_time_from) { ?>
                                    <div class="text-danger"><?php echo $error_time_from; ?></div>
                                    <?php } ?>
                                </label>
                                <label class="to">по 
                                    <input type="date" name="date_before" placeholder="01.01.2017" value="">
                                    <?php if ($error_date_before) { ?>
                                    <div class="text-danger"><?php echo $error_date_before; ?></div>
                                    <?php } ?>
                                    <input type="time" name="time_before" placeholder="12:00" value="">
                                    <?php if ($error_time_before) { ?>
                                    <div class="text-danger"><?php echo $error_time_before; ?></div>
                                    <?php } ?>
                                </label>
                                <label class="surname"><em>*</em>Фамилия:<input type="text" name="surname" placeholder="Фамилия" value=""></label>
                                <?php if ($error_surname) { ?>
                                <div class="text-danger"><?php echo $error_surname; ?></div>
                                <?php } ?>
                                <label class="name"><em>*</em>Имя: <input type="text" name="name" placeholder="Имя:" value=""></label>
                                <?php if ($error_name) { ?>
                                <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                                <label class="patronymic"><em>*</em>Отчество:<input type="text" name="patronymic" placeholder="Отчество" value=""></label>
                                <?php if ($error_patronymic) { ?>
                                <div class="text-danger"><?php echo $error_patronymic; ?></div>
                                <?php } ?>
                                <label class="birthday"><em>*</em>Дата рождения: <input type="date" name="born" placeholder="01.01.2017" value=""></label>
                                <?php if ($error_born) { ?>
                                <div class="text-danger"><?php echo $error_born; ?></div>
                                <?php } ?>
                                <label class="primary-phone"><em>*</em>Основной номер телефона: <input type="tel" name="phone" placeholder="+7 (123) 456 78 9" value=""></label>
                                <?php if ($error_phone) { ?>
                                <div class="text-danger"><?php echo $error_phone; ?></div>
                                <?php } ?>
                        </div>
                        <div class="col-md-6 pad-right">
                            <p class="form-title form-title-pasport">
                                Паспорт
                            </p>
                                <label class="number"><em>*</em>Серия и номер:<input type="text" name="serial" placeholder="Отчество" value=""></label>
                                <?php if ($error_serial) { ?>
                                <div class="text-danger"><?php echo $error_serial; ?></div>
                                <?php } ?>
                                <label class="date"><em>*</em>Дата выдачи:<input type="date" name="issue_date" placeholder="01.01.2017" value=""></label>
                                <?php if ($error_issue_date) { ?>
                                <div class="text-danger"><?php echo $error_issue_date; ?></div>
                                <?php } ?>
                                <label class="issued"><em>*</em>Кем выдан: <input type="text" name="issued_by" placeholder="123456789" value=""></label>
                                <?php if ($error_issued_by) { ?>
                                <div class="text-danger"><?php echo $error_issued_by; ?></div>
                                <?php } ?>
                                <label class="address"><em>*</em>Адрес регистрации: <input type="text" name="registration" placeholder="123456789" value=""></label>
                                <?php if ($error_registration) { ?>
                                <div class="text-danger"><?php echo $error_registration; ?></div>
                                <?php } ?>
                                <label class="address-fact"><em>*</em>Фактический адрес прожимания: <input type="text" name="address" placeholder="123456789" value=""></label>
                                <?php if ($error_address) { ?>
                                <div class="text-danger"><?php echo $error_address; ?></div>
                                <?php } ?>
                                <p class="form-title form-title-pasport">
                                Водительские права
                                </p>
                                <label class="number"><em>*</em>Серия и номер:<input type="text" name="license" placeholder="123456789" value=""></label>
                                <?php if ($error_license) { ?>
                                <div class="text-danger"><?php echo $error_license; ?></div>
                                <?php } ?>
                                <label class="date"><em>*</em>Дата выдачи:<input type="date" name="license_issued_by" placeholder="01.01.2017" value=""></label>
                                <?php if ($error_license_issued_by) { ?>
                                <div class="text-danger"><?php echo $error_license_issued_by; ?></div>
                                <?php } ?>
                        </div>
    
                        <div class="col-md-12 pad-left pad-right">
                            <p class="form-title">
                                <span>2</span> Дополнительная информация
                            </p>
                                <label class="place-birth"><em>*</em>Место рождения: <input type="text" name="city" placeholder="г. Ростов-на-Дону" value=""></label>
                                <?php if ($error_city) { ?>
                                <div class="text-danger"><?php echo $error_city; ?></div>
                                <?php } ?>
                                <label class="add-phone">Дополнительный телефон: <input type="text" name="add_phone" placeholder="+7 (123) 456 78 9" value=""></label>
                                <label class="mail">E-mail: <input type="email" name="email" placeholder="Введите Ваш  e-mail" value=""></label>
                                <label class="car-supply"><em>*</em>Место подачи авто: <input type="text" name="issue_place" placeholder="г. Ростов-на-Дону" value=""></label>
                                <?php if ($error_issue_place) { ?>
                                <div class="text-danger"><?php echo $error_issue_place; ?></div>
                                <?php } ?>
                                <div class="i-take-block">
                                    <input id="i-take" type="checkbox" name="i_take" value="1">
                                    <label for="i-take">Самостоятельно заберу</label>
                                </div>
                        </div>
    
                        <div class="col-md-12 pad-left pad-right">
                            <p class="form-title">
                                <span>3</span> Дополнительные услуги
                            </p>
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
