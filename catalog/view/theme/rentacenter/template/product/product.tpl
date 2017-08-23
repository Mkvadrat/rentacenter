<?php echo $header; ?>

    <!-- start main-index -->

    <main class="main-cars-in">
  
        <!-- start banner-under-header -->
        <div class="container-fluid black-banner">
            <div class="container">
                <div class="row">
                      <div class="col-md-12">
                          <h1 class="title-black-banner"><?php echo $heading_title; ?></h1>
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
                    <div class="col-md-9 pad-left">
                        
                        <div class="block-slider">
                            <?php if ($thumb || $images) { ?>
                            <div id="example3" class="slider-pro">
                                <?php if (!$images) { ?>
                                <div class="sp-slides">
                                    <div class="sp-slide">
                                        <img class="sp-image" src="<?php echo $thumb; ?>"/>
                                    </div>
                                </div>
                                <?php }else{ ?>
                                <div class="sp-slides">
                                    <?php foreach ($images as $image) { ?>
                                    <div class="sp-slide">
                                        <img class="sp-image" src="<?php echo $image['popup']; ?>"/>
                                    </div>
                                    <?php } ?>
                                </div>
                                
                                <div class="sp-thumbnails">
                                    <?php foreach ($images as $image) { ?>
                                    <img class="sp-thumbnail" src="<?php echo $image['popup']; ?>"/>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            
                            <div class="description">
                              <p class="title"><?php echo $heading_title; ?></p>
                              <ul>
                                <?php if($options){ ?>
                                <li>
                                <?php foreach ($options as $product_option) { ?>
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
                                <li>Цена в сутки от <span><?php echo $price; ?></span></li>
                                <li>
                                <?php foreach ($options as $product_option) { ?>
                                    <?php if($product_option['option_id'] == 17){ ?>
                                    <div class="option">
                                    <div class="product-option"><?php echo $product_option['name']; ?>:</div>
                                    <div class="block-select">
                                    <select id="price_<?php echo $product_id; ?>">
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
                                
                                <li id="total-<?php echo $product_id; ?>">Итого: <strong><?php echo $price; ?></strong></li>
                              </ul>
                              <a class="button-yellow" id="booking-<?php echo $product_id; ?>" href="<?php echo $booking; ?>">Забронировать авто</a>
                            </div>
                        </div>
                
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#panel1">Описание</a></li>
                            <li><a data-toggle="tab" href="#panel2">Тарифы</a></li>
                        </ul>
                
                        <div class="tab-content">
                            <div id="panel1" class="tab-pane fade in active">
                              <?php echo $description; ?>
                            </div>
                            <div id="panel2" class="tab-pane fade">
                              <?php echo $rates; ?>
                            </div>
                        </div>
                    </div>
                    <?php if ($products) { ?>
                    <div class="col-md-3">
                        <p class="title-text">Рекомендуемые авто</p>
                        <ul class="recommended-cars">
                            <?php foreach ($products as $product) { ?>
                            <li>
                              <div class="block-photo">
                                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
                              </div>
                              <div class="description">
                                    <p class="title"><?php echo $product['name']; ?></p>
                                    <p>Цена в сутки от <span><?php echo $product['price']; ?></span></p>
                                    <a class="button-yellow" href="<?php echo $product['booking']; ?>">Забронировать авто</a>
                                <a href="<?php echo $product['href']; ?>">Подробнее об авто</a>
                              </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </main>

    <script>
    $(document).ready(function() {
        // SLIDER-PRO
        $( '#example3' ).sliderPro({
            width: 510,
            height: 345,
            fade: true,
            arrows: true,
            buttons: false,
            fullScreen: true,
            shuffle: true,
            smallSize: 500,
            mediumSize: 1000,
            largeSize: 3000,
            thumbnailArrows: true,
            autoplay: false
        });
    });
    </script>
    
    <script>
    //Загрузка страницы
    $(function() {
        $(window).load(function(){
            $.ajax({
                url: 'index.php?route=product/product/renderTotal',
                type: 'POST',
                data: {
                    'product_id' : '<?php echo $product_id; ?>',
                    'change_price' : $('#price_<?php echo $product_id; ?>').val()
                },
                dataType: 'json',
                success: function(data) {
                    $( "#total-<?php echo $product_id; ?>" ).replaceWith('<li id="total-<?php echo $product_id; ?>">Итого: <strong>'+ data.message +'</strong></li>');
                    $( "#booking-<?php echo $product_id; ?>" ).replaceWith('<a class="button-yellow" id="booking-<?php echo $product_id; ?>" href="<?php echo $booking . '&total='; ?>' + data.clear_price +'">Забронировать авто</a>');
                }
            });
        });
    });
   
   <?php if($mobile || $tablet){ ?>
    $(function() {
      $("#price_<?php echo $product['product_id']; ?>").change(function() {
        $.ajax({
            url: 'index.php?route=product/product/renderTotal',
            type: 'POST',
            data: {
                'product_id' : '<?php echo $product_id; ?>',
                'change_price' : $('#price_<?php echo $product_id; ?>').val()
            },
            dataType: 'json',
            success: function(data) {
                $( "#total-<?php echo $product_id; ?>" ).replaceWith('<li id="total-<?php echo $product_id; ?>">Итого: <strong>'+ data.message +'</strong></li>');
                $( "#booking-<?php echo $product_id; ?>" ).replaceWith('<a class="button-yellow" id="booking-<?php echo $product_id; ?>" href="<?php echo $booking . '&total='; ?>' + data.clear_price +'">Забронировать авто</a>');
            }
        });
      });
    });
   <?php }else{ ?>
    //Действие по клику 
    $(function() {
      $("#price_<?php echo $product_id; ?>").click(function() {
        $.ajax({
            url: 'index.php?route=product/product/renderTotal',
            type: 'POST',
            data: {
                'product_id' : '<?php echo $product_id; ?>',
                'change_price' : $('#price_<?php echo $product_id; ?>').val()
            },
            dataType: 'json',
            success: function(data) {
                $( "#total-<?php echo $product_id; ?>" ).replaceWith('<li id="total-<?php echo $product_id; ?>">Итого: <strong>'+ data.message +'</strong></li>');
                $( "#booking-<?php echo $product_id; ?>" ).replaceWith('<a class="button-yellow" id="booking-<?php echo $product_id; ?>" href="<?php echo $booking . '&total='; ?>' + data.clear_price +'">Забронировать авто</a>');
            }
        });
      });
    });
    <?php } ?>
    </script>

<?php echo $footer; ?>
