<?php echo $header; ?>

    <!-- start main-index -->
  
    <main class="main-cars-in">
  
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
                                  <p class="title">Volkswagen Jetta 2016 г.</p>
                                  <ul>
                                      <li>Автомат: Есть</li>
                                      <li>Кондиционер: Есть</li>
                                      <li>Топливо: Бензин</li>
                                      <li>Залог: 15000 р.</li>
                                      <li>Цена в сутки от <span>2500 р.</span></li>
                                      <li>Количество дней:
                                          <div class="block-select">
                                              <select name="" id="">
                                                  <option value="">1 сутки - 3000 р/сут</option>
                                                  <option value="">2 сутки - 4000 р/сут</option>
                                                  <option value="">3 сутки - 5000 р/сут</option>
                                                  <option value="">4 сутки - 6000 р/сут</option>
                                                  <option value="">5 сутки - 7000 р/сут</option>
                                              </select>
                                          </div>
                                      </li>
                                      <li>Итого: <strong>2500 р.</strong></li>
                                  </ul>
                                  <a class="button-yellow" href="#">Забронировать авто</a>
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
                      <div class="col-md-3">
                          <p class="title-text">Рекомендуемые авто</p>
                          <ul class="recommended-cars">
                              <li>
                                  <div class="block-photo">
                                      <img src="images/car.jpg" alt="">
                                  </div>
                                  <div class="description">
                                      <p class="title">Volkswagen Jetta 2016 г.</p>
                                      <p>Цена в сутки от <span>2500 р.</span></p>
                                      <a class="button-yellow" href="#">Забронировать авто</a>
                                  <a href="#">Подробнее об авто</a>
                              </li>
                              <li>
                                  <div class="block-photo">
                                      <img src="images/car.jpg" alt="">
                                  </div>
                                  <div class="description">
                                      <p class="title">Volkswagen Jetta 2016 г.</p>
                                      <p>Цена в сутки от <span>2500 р.</span></p>
                                      <a class="button-yellow" href="#">Забронировать авто</a>
                                  <a href="#">Подробнее об авто</a>
                              </li>
                          </ul>
                    </div>
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

<?php echo $footer; ?>
