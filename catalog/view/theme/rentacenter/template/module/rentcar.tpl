    <main class="main-index">
    
        <!-- start banner-under-header -->

        <!-- start new page -->

        <div class="container banner-under-header">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="title-banner">Аренда авто в Ростове на Дону</h1>
                    <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                </div>
            </div>
        </div>

        <div class="big-banner">
          <img src="catalog/view/theme/rentacenter/images/photo-index.jpg" alt="">
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="about-block">
                      <p style="padding-bottom: 20px; text-align: left;">
                        Наша компания предоставляет услуги по аренде автомобилей в городе Ростов на Дону, а также автопрокат по России. Арендовать авто вы можете позвонив нам или заполнив форму заказа. Основное направление деятельности, компании Аvto-Prokat — аренда авто в Ростове на Дону. Клиентам предоставляются автомобили бизнес класса популярных европейских и азиатских марок. Машины обслуживаются квалифицированными штатными техниками, поэтому находятся в отличном эксплуатационном состоянии. Чтобы взять авто в аренду, потребуется минимум усилий и времени — заказ оформляется по телефону, или непосредственно на сайте компании.
                      </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container attention-block">
            <div class="row">
                <div class="col-md-6">
                    <img src="catalog/view/theme/rentacenter/images/attention-photo.jpg" alt="">
                </div>
                <div class="col-md-6">
                    <p class="title-banner">Внимание!</p>
                    <p>минимальный возраст 23 года<br>стаж вождения не менее двух лет<br>наличие паспорта, идентификационного<br>кода (для жителей Украины), водительского<br>удостоверения</p>
                </div>
            </div>
        </div>

        <!-- end new page -->

        <?php if($products){?>
        <!-- start list-car -->
        <div class="container">
            <div class="row">   
                <div class="content-block">
                    <div class="col-md-12">
                        <ul class="list-car">
                            <?php foreach ($products as $product) { ?>
                            <li>
                                <div class="block-photo">
                                    <img src="<?php echo $product['thumb']; ?>" alt="">
                                </div>
                                <div class="description">
                                    <p class="title"><?php echo $product['name']; ?></p>
                                    <ul>
                                      <?php if($product['option']){ ?>
                                      <li>
                                      <?php foreach ($product['option'] as $product_option) { ?>
                                          <?php if($product_option['option_id'] != 17){ ?>
                                          <?php if($product_option['type'] == 'text') {?>
                                          <div class="option">
                                          <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                          <div class="product-value"><?php echo $product_option['value']; ?></div>
                                          </div>
                                          <?php }else{ ?>
                                          <div class="option">
                                          <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                          <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                          <div class="product-value"><?php echo $product_option_value['name']; ?></div>
                                          <?php } ?>
                                          </div>
                                          <?php } ?>
                                          <?php } ?>
                                      <?php } ?>
                                      </li>
                                      <li>
                                          Цена в сутки от <span><?php echo $product['price']; ?></span>
                                      </li>
                                      <li>
                                      <?php foreach ($product['option'] as $product_option) { ?>
                                          <?php if($product_option['option_id'] == 17){ ?>
                                          <div class="option">
                                          <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                          <div class="block-select">
                                          <select id="price_<?php echo $product['product_id']; ?>">
                                          <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                          <option value="<?php echo $product_option_value['price']; ?>"><?php echo $product_option_value['name']; ?></option>
                                          <?php } ?>
                                          </select>
                                          </div>
                                          </div>
                                          <?php } ?>
                                      <?php } ?>
                                      </li>
                                      <?php } ?>
                                      <li id="total-<?php echo $product['product_id']; ?>">Итого: <strong><?php echo $product['price']; ?></strong></li>
                                    </ul>
                                    <a class="button-yellow" id="booking-<?php echo $product['product_id']; ?>" href="<?php echo $product['booking']; ?>">Забронировать авто</a>
                                    <a href="<?php echo $product['href']; ?>">Подробнее об авто</a>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>

        <div class="container view-all-park">
          <div class="row">
            <div class="col-md-12">
                <a class="button-yellow" href="#">Посмотреть весь автопарк</a>
            </div>
          </div>
        </div>

        <div class="container">
          <div class="row">
            <div class="content-block" style="border-top: none">
              <div class="col-md-12">
                <div class="text-block text-block-main">
                  <p>Клиент должен сформулировать требования, предъявляемые к машине, указав приоритетные рабочие показатели (мощность, проходимость, тип коробки передач, оснащение салона, дополнительные удобства и т.д.), и мы выберем подходящую марку транспорта. Второй вариант — модель выбирается в электронном каталоге, где представлены все имеющиеся в распоряжении фирмы «Авто-Прокат» автомобили.</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="container banner-under-header banner-main">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="title-banner">Аренда авто недорого в Ростове</h2>
                    <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                </div>
            </div>
        </div>

        <div class="container photo-text-block">
            <div class="row">
                <div class="col-md-6">
                  <img src="catalog/view/theme/rentacenter/images/photo-index-2.jpg" alt="">
                </div>
                <div class="col-md-6">
                  <p>Аренда авто недорого, надежно, оперативно, с гарантией безопасной эксплуатации — такие условия представляют интерес для всех, кто ищет машину для краткосрочного или длительного использования. В «АвтоПрокате» заказывают машины командированные, туристы, бизнесмены представители общественных организаций, а также местные жители, у которых личные автомобили находятся в ремонте.</p>

                  <p>Аренда авто для работы — одна из востребованных услуг, которой регулярно пользуются субъекты предпринимательской деятельности. При заключении договора аренды на эксплуатацию транспортного средства в течение месяца (и более), клиенту предоставляется скидка. Мы ценим постоянных заказчиков, и применяем индивидуальный подход при обсуждении условий пользования автомобилем.</p>
                </div>
            </div>
        </div>

        <div class="container banner-under-header banner-main">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="title-banner">Взять авто в аренду по выгодным ценам</h3>
                    <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="about-block">
                      <p style="padding-bottom: 20px; text-align: center; text-indent: 0;">
                        На аренду авто цены зависят от периода использованием (несколько часов, сутки, неделя, длительная эксплуатация), марки и модели машины. Техническое оснащение, повышающее комфортабельность автомобиля, оказывает влияние на стоимость аренды — так наличие кондиционера и дополнительной системы обогрева, дорогостоящая отделка салона увеличивают цену услуги.
                      </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container conditions-block">
          <div class="row">
            <div class="content-block" style="border-top: none">
              <div class="text-block text-block-main">
                <div class="photo-block">
                  <img src="catalog/view/theme/rentacenter/images/photo-index-3.jpg" alt="">
                </div>
                <p><strong>Взять авто в аренду в Ростове с гарантией надежности</strong>, по минимальной стоимости — реальная возможность, предоставляемая нашей компанией всем физическим лицам и организациям, нуждающимся в легковом транспорте.</p>
              </div>

              <div class="text-block text-block-main">
                <div class="photo-block">
                  <img src="catalog/view/theme/rentacenter/images/photo-index-4.jpg" alt="">
                </div>
                <p><strong>Аренда авто посуточно — сервис</strong>, пользующийся популярностью в любой сезон. Аккуратные новые машины берут на свадебные мероприятия, загородные прогулки, семейные путешествия в выходные дни. Это очень удобная услуга, когда к дому клиента подают автомобиль с полным баком, в отличном рабочем состоянии.</p>
              </div>

              <div class="text-block text-block-main">
                <div class="photo-block">
                  <img src="catalog/view/theme/rentacenter/images/photo-index-5.jpg" alt="">
                </div>
                <p><strong>Мы не ограничиваем заказчиков по срокам использования</strong> — оплата начисляется только за время эксплуатации, на условиях, зафиксированных в договоре аренды. Условия сотрудничества понятны и просты — машина выдается только лицам, имеющим опыт вождения не менее двух лет.</p>
              </div>

              <div class="text-block text-block-main">
                <div class="photo-block">
                  <img src="catalog/view/theme/rentacenter/images/photo-index-6.jpg" alt="">
                </div>
                <p><strong>Минимальный возраст водителя — 23 года</strong>, наличие прав — обязательное условие для предоставления транспортного средства.<br><br>
                <strong>Ограничения по аренде авто на сутки тоже существуют</strong>— пробег за этот период не должен превышать 400 км.</p>
              </div>
            </div>
          </div>
        </div>

        <div class="container banner-under-header banner-main">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="title-banner">Аренда авто на сутки в Ростове</h4>
                    <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                </div>
            </div>
        </div>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="column-text">
        <div class="block-photo"> <img src="catalog/view/theme/rentacenter/images/photo-index-7.jpg" alt=""> </div>

        <div class="description">

          <p align="left">Бывают ситуации, когда аренда авто на сутки требуется в срочном порядке. Например, вам позвонили друзья или родственники с просьбой встретить в аэропорту, Такси брать невыгодно, поскольку самолеты часто прибывают в пункт назначения с задержками, а водителю нанятой машины придется платить за простой.</p>

        </div>

      </div>

    </div>

    <div class="col-md-4">
      <div class="column-text">
        <div class="block-photo"> <img src="catalog/view/theme/rentacenter/images/photo-index-8.jpg" alt=""> </div>

        <div class="description">

          <p align="left">Аренда легкового транспорта актуальна и в том случае, если произошла поломка коммерческого автомобиля компании, а руководителю необходимо прибыть на конференцию в другой город. Достаточно позвонить по телефону и оформить срочный заказ, выбрав нужную модель машины. <i>Помните, что при оформлении заказа необходимо оформить доверенность по установленному образцу на лицо, получающее автомобиль в личное распоряжение.</i></p>

        </div>

      </div>

    </div>

    <div class="col-md-4">
      <div class="column-text">
        <div class="block-photo"> <img src="catalog/view/theme/rentacenter/images/photo-index-9.jpg" alt=""> </div>

        <div class="description">

          <p align="left">Аренда авто на несколько часов, на сутки или месяц — условия эксплуатации машины выбирает клиент. Со своей стороны, мы предупреждаем, что машина должна быть возвращена в аккуратном виде, технически исправной, и с заполненным топливным баком. Если поломка произошла вскоре после выезда с парковки фирмы «АвтоПрокат», немедленно сообщите об этом факте нашему менеджеру. Клиенту выберут другую машину, либо вернут деньги за неиспользованную услугу.</p>

        </div>

      </div>

    </div>
  </div>
</div>

<div class="container">
          <div class="row">
            <div class="content-block" style="border-top: none">
              <div class="col-md-12">
                <div class="text-block text-block-main">
                  <p>Об аренде авто, предоставляемых нашей компанией, отзывы, в основном, положительные. Сервис детально продуман, условия договора прозрачные, цены доступные. Фирма предоставляет комплект документов для бухгалтерского и налогового учета, оформленных по утвержденным нормативам. Позвоните по контактному телефону, указанному на сайте, чтобы получить дополнительную информацию или услышать ответы на вопросы, которые остались после прочтения материала сайта.</p>
                </div>
              </div>
            </div>
          </div>
        </div>






























        <!-- ТЕКСТ ГЛАВНОЙ -->

        <!--<div class="container banner-under-header">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="title-banner"><?php echo $main_title; ?></h1>
                    <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                    <div class="about-block">
                        <?php echo $main_description?>
                    </div>
                </div>
            </div>
        </div>

        <!-- ТЕКСТ ГЛАВНОЙ -->

        <!-- end banner-under-header -->
    
        <!--<?php if($products){?>
        <!-- start list-car -->
        <!--<div class="container">
            <div class="row">   
                <div class="content-block">
                    <div class="col-md-12">
                        <ul class="list-car">
                            <?php foreach ($products as $product) { ?>
                            <li>
                                <div class="block-photo">
                                    <img src="<?php echo $product['thumb']; ?>" alt="">
                                </div>
                                <div class="description">
                                    <p class="title"><?php echo $product['name']; ?></p>
                                    <ul>
                                      <?php if($product['option']){ ?>
                                      <li>
                                      <?php foreach ($product['option'] as $product_option) { ?>
                                          <?php if($product_option['option_id'] != 17){ ?>
                                          <?php if($product_option['type'] == 'text') {?>
                                          <div class="option">
                                          <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                          <div class="product-value"><?php echo $product_option['value']; ?></div>
                                          </div>
                                          <?php }else{ ?>
                                          <div class="option">
                                          <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                          <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                          <div class="product-value"><?php echo $product_option_value['name']; ?></div>
                                          <?php } ?>
                                          </div>
                                          <?php } ?>
                                          <?php } ?>
                                      <?php } ?>
                                      </li>
                                      <li>
                                          Цена в сутки от <span><?php echo $product['price']; ?></span>
                                      </li>
                                      <li>
                                      <?php foreach ($product['option'] as $product_option) { ?>
                                          <?php if($product_option['option_id'] == 17){ ?>
                                          <div class="option">
                                          <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                          <div class="block-select">
                                          <select id="price_<?php echo $product['product_id']; ?>">
                                          <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                          <option value="<?php echo $product_option_value['price']; ?>"><?php echo $product_option_value['name']; ?></option>
                                          <?php } ?>
                                          </select>
                                          </div>
                                          </div>
                                          <?php } ?>
                                      <?php } ?>
                                      </li>
                                      <?php } ?>
                                      <li id="total-<?php echo $product['product_id']; ?>">Итого: <strong><?php echo $product['price']; ?></strong></li>
                                    </ul>
                                    <a class="button-yellow" id="booking-<?php echo $product['product_id']; ?>" href="<?php echo $product['booking']; ?>">Забронировать авто</a>
                                    <a href="<?php echo $product['href']; ?>">Подробнее об авто</a>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <!-- end list-car -->
    
        <!--<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p class="text-center">
                        <a href="<?php echo $view_all; ?>" class="button-yellow">Посмотреть весь автопарк</a>
                    </p>
                </div>
                
                <?php echo $html; ?>
                
            </div>
        </div>
    
    </main>
  
    <script>
    <?php foreach ($products as $product) { ?>
    $(function() {
        $(window).load(function(){
            $.ajax({
                url: 'index.php?route=module/rentcar/renderTotal',
                type: 'POST',
                data: {
                    'product_id' : '<?php echo $product['product_id']; ?>',
                    'change_price' : $('#price_<?php echo $product['product_id']; ?>').val()
                },
                dataType: 'json',
                success: function(data) {
                    $( "#total-<?php echo $product['product_id']; ?>" ).replaceWith('<li id="total-<?php echo $product['product_id']; ?>">Итого: <strong>'+ data.message +'</strong></li>');
                    $( "#booking-<?php echo $product['product_id']; ?>" ).replaceWith('<a class="button-yellow" id="booking-<?php echo $product['product_id']; ?>" href="<?php echo $product['booking'] . '&total='; ?>' + data.clear_price +'">Забронировать авто</a>');
                }
            });
        });
    });

    <?php if($mobile || $tablet){ ?>
    $(function() {
      $("#price_<?php echo $product['product_id']; ?>").change(function() {
        $.ajax({
            url: 'index.php?route=module/rentcar/renderTotal',
            type: 'POST',
            data: {
                'product_id' : '<?php echo $product['product_id']; ?>',
                'change_price' : $('#price_<?php echo $product['product_id']; ?>').val()
            },
            dataType: 'json',
            success: function(data) {
                $( "#total-<?php echo $product['product_id']; ?>" ).replaceWith('<li id="total-<?php echo $product['product_id']; ?>">Итого: <strong>'+ data.message +'</strong></li>');
                $( "#booking-<?php echo $product['product_id']; ?>" ).replaceWith('<a class="button-yellow" id="booking-<?php echo $product['product_id']; ?>" href="<?php echo $product['booking'] . '&total='; ?>' + data.clear_price +'">Забронировать авто</a>');
            }
        });
      });
    });
    <?php }else{ ?>
    $(function() {
      $("#price_<?php echo $product['product_id']; ?>").click(function() {
        $.ajax({
            url: 'index.php?route=module/rentcar/renderTotal',
            type: 'POST',
            data: {
                'product_id' : '<?php echo $product['product_id']; ?>',
                'change_price' : $('#price_<?php echo $product['product_id']; ?>').val()
            },
            dataType: 'json',
            success: function(data) {
                $( "#total-<?php echo $product['product_id']; ?>" ).replaceWith('<li id="total-<?php echo $product['product_id']; ?>">Итого: <strong>'+ data.message +'</strong></li>');
                $( "#booking-<?php echo $product['product_id']; ?>" ).replaceWith('<a class="button-yellow" id="booking-<?php echo $product['product_id']; ?>" href="<?php echo $product['booking'] . '&total='; ?>' + data.clear_price +'">Забронировать авто</a>');
            }
        });
      });
    });
    <?php } ?>
    <?php } ?>
    </script>

    <!-- end main-index -->