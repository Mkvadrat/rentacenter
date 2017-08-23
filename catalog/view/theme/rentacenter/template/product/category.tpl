<?php echo $header; ?>

    <!-- start main-index -->

    <main class="main-cars">

        <!-- start banner-under-header -->

        <div class="container-fluid black-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="title-black-banner"><?php echo $heading_name; ?></h1>
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
        <div class="container banner-under-header">
            <div class="row">
                <div class="col-md-12">
                    <p class="title-banner"><?php echo $heading_title; ?></p>
                    <img src="catalog/view/theme/rentacenter/images/banner-main.png" alt="">
                    <div class="about-block">
                    <?php if ($description) { ?>
                        <?php echo $description; ?>
                    <?php } ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="content-block">
                    <div class="col-md-12">
                        
                        <?php if($products){?>
                        
                        <?php echo $content_top; ?>
                        
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
                        <?php }else{ ?>
                            <p>Автомобилей не найдено!</p>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>

        <!-- end list-car -->

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="bread-crumbs-numbers">
                        <?php echo $pagination; ?>
                    </ul>
                </div>
            </div>
        </div>

    </main>
    
    <script>
    <?php foreach ($products as $product) { ?>
    $(function() {
        $(window).load(function(){
        $.ajax({
            url: 'index.php?route=module/rentcar/renderTotal',
            type: 'post',
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
            type: 'post',
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
            type: 'post',
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

<?php echo $footer; ?>
