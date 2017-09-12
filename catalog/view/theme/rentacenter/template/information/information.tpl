<?php echo $header; ?>

  <main class="main-index main-text">

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
          <div class="col-md-12">
            <div class="text-block">
                <!--<p class="title-text"><?php echo $heading_title; ?></p>-->
                <!--<?php //echo $description; ?>-->
                <p><strong style="font-weight: bold;">Тарифы включают</strong> стоимость аренды, ТО.</p>
<p><strong style="font-weight: bold;">Тарифы не включают</strong> стоимость бензина, расходы на платные стоянки и парковки, штрафы и шиномонтажные работы.</p>
<span><strong style="font-weight: bold;">Дополнительно оплачиваются:</strong></span><ul class="list-info">
	<li>• Подача авто по Ростову на Дону с 8.00 до 18.00</li>
	<li>• Возврат авто не возле офиса компании - 500 руб.</li>
	<li>• Возврат авто с опозданием - 300 руб.</li>
	<li>• Возврат авто с опозданием не возле офиса компании - 300 руб.</li>
	<li>• Мойка (если автомобиль был возвращен в грязном виде)</li>
	<li>• Бензин (если автомобиль был возвращен с уровнем топлива меньшим, чем при подаче)</li>
	<li>• Перепробег (если превышен лимит по пробегу из расчета 3 руб/км)</li>
</ul>
<br><span><strong style="font-weight: bold;">Дополнительные услуги:</strong></span><p>Мы заботимся о комфорте и безопасности наших клиентов и их пассажиров – больших и маленьких.</p>
<span>Поэтому у нас вы можете заказать также:</span><ul>
	<li>• Безлимитный пробег 1500 р.</li>
	<li>• Видеорегистратор 300 р.</li>
	<li>• WIFI в Автомобиле 300 р.</li>
	<li>• Возврат автомобиля 500 р.</li>
	<li>• Детектор радаров 300 р.</li>
	<li>• Детское кресло 200 р.</li>
	<li>• Дополнительный водитель 500 р.</li>
	<li>• Страховка любого стекла и колес 1000 р.</li>
	<li>• GPS навигатор 100 р.</li>
</ul>
<br>
                          <div class="fully-shit">
                            <table cellspacing="0" cellpadding="0" border="0" class="table-price">
                              <thead>
                                <tr>
                                    <td style="text-align: center;" class="sttdone"><strong>Авто</strong>                                    </td>
                                    <td style="text-align: center;" class="sttdtwo"><strong>КПП</strong>                                    </td>
                                    <td style="text-align: center;" class="sttdthree"><strong>1 сутки, <nobr>р./сутки</nobr></strong>                                    </td>
                                    <td style="text-align: center;" class="sttdfour"><strong>2-3 суток, <nobr>р./сутки</nobr></strong>                                    </td>
                                    <td style="text-align: center;" class="sttdfive"><strong>4-7 суток, <nobr>р./сутки</nobr></strong>                                    </td>
                                    <td style="text-align: center;" class="sttdsix"><strong>8 - 14 суток, <nobr>р./сутки</nobr></strong>                                    </td>
                                    <td style="text-align: center;" class="sttdseven"><strong>15-29 суток, <nobr>р./сутки</nobr></strong>                                    </td>
                                    <td style="text-align: center;" class="sttdeight"><strong>от 30 суток, <nobr>р./сутки</nobr></strong>                                    </td>
                                    <td style="text-align: center;" class="sttdnine"><strong>Залог, р.</strong>                                    </td>
                                    <td style="text-align: center;" class="sttdten"><strong>Доп. час, р.</strong>                                    </td>
                                </tr>
                              </thead>
                               <tbody>
                                <tr>
                                    <td style="text-align: center;" class="tdone"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=65">Renault Logan</a>                                    </td>
                                    <td style="text-align: center;" class="tdtwo">Ручная</td>
                                    <td style="text-align: center;" class="tdthree">1600</td>
                                    <td style="text-align: center;" class="tdfour">1500</td>
                                    <td style="text-align: center;" class="tdfive">1400</td>
                                    <td style="text-align: center;" class="tdsix">1300</td>
                                    <td style="text-align: center;" class="tdseven">1200</td>
                                    <td style="text-align: center;" class="tdeight">1100</td>
                                    <td style="text-align: center;" class="tdnine">7000</td>
                                    <td style="text-align: center;" class="tdten">300</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=59">Chevrolet Lacetti</a>                                    </td>
                                    <td style="text-align: center;">Ручная</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">1900</td>
                                    <td style="text-align: center;">1800</td>
                                    <td style="text-align: center;">1700</td>
                                    <td style="text-align: center;">1600</td>
                                    <td style="text-align: center;">1500</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=62">Chevrolet Aveo</a>                                    </td>
                                    <td style="text-align: center;">Ручная</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">1900</td>
                                    <td style="text-align: center;">1800</td>
                                    <td style="text-align: center;">1700</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=61">Volkswagen Polo</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">1900</td>
                                    <td style="text-align: center;">1800</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=56">ŠKODA Fabia</a>                                    </td>
                                    <td style="text-align: center;">Ручная</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">1900</td>
                                    <td style="text-align: center;">1800</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=52">Ford Fiesta</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">1900</td>
                                    <td style="text-align: center;">1800</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=64">Ford Focus</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2500</td>
                                    <td style="text-align: center;">2400</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">10000</td>
                                    <td style="text-align: center;">450</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=63">Hyundai Solaris</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2250</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2150</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">350</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=57">Toyota Corolla</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2500</td>
                                    <td style="text-align: center;">2400</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=53">Mitsubishi Lancer</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2500</td>
                                    <td style="text-align: center;">2400</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">10000</td>
                                    <td style="text-align: center;">450</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=51">Honda Civic</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2500</td>
                                    <td style="text-align: center;">2400</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=50">Mazda 3</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">2500</td>
                                    <td style="text-align: center;">2400</td>
                                    <td style="text-align: center;">2300</td>
                                    <td style="text-align: center;">2200</td>
                                    <td style="text-align: center;">2100</td>
                                    <td style="text-align: center;">2000</td>
                                    <td style="text-align: center;">7000</td>
                                    <td style="text-align: center;">400</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=50">Mazda 6</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">3500</td>
                                    <td style="text-align: center;">3400</td>
                                    <td style="text-align: center;">3300</td>
                                    <td style="text-align: center;">3200</td>
                                    <td style="text-align: center;">3100</td>
                                    <td style="text-align: center;">3000</td>
                                    <td style="text-align: center;">15000</td>
                                    <td style="text-align: center;">500</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=67">ŠKODA Octavia</a>                                    </td>
                                    <td style="text-align: center;">Ручная</td>
                                    <td style="text-align: center;">3000</td>
                                    <td style="text-align: center;">2900</td>
                                    <td style="text-align: center;">2800</td>
                                    <td style="text-align: center;">2700</td>
                                    <td style="text-align: center;">2600</td>
                                    <td style="text-align: center;">2500</td>
                                    <td style="text-align: center;">15000</td>
                                    <td style="text-align: center;">500</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=54">Hyundai Elantra</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">3200</td>
                                    <td style="text-align: center;">3100</td>
                                    <td style="text-align: center;">3000</td>
                                    <td style="text-align: center;">2900</td>
                                    <td style="text-align: center;">2800</td>
                                    <td style="text-align: center;">2700</td>
                                    <td style="text-align: center;">12000</td>
                                    <td style="text-align: center;">500</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=60">Volkswagen Passat</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">3500</td>
                                    <td style="text-align: center;">3400</td>
                                    <td style="text-align: center;">3300</td>
                                    <td style="text-align: center;">3200</td>
                                    <td style="text-align: center;">3100</td>
                                    <td style="text-align: center;">3000</td>
                                    <td style="text-align: center;">15000</td>
                                    <td style="text-align: center;">500</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=58">Toyota Camry</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">3500</td>
                                    <td style="text-align: center;">3400</td>
                                    <td style="text-align: center;">3300</td>
                                    <td style="text-align: center;">3200</td>
                                    <td style="text-align: center;">3100</td>
                                    <td style="text-align: center;">3000</td>
                                    <td style="text-align: center;">15000</td>
                                    <td style="text-align: center;">500</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=55">Honda Accord</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">3500</td>
                                    <td style="text-align: center;">3400</td>
                                    <td style="text-align: center;">3300</td>
                                    <td style="text-align: center;">3200</td>
                                    <td style="text-align: center;">3100</td>
                                    <td style="text-align: center;">3000</td>
                                    <td style="text-align: center;">15000</td>
                                    <td style="text-align: center;">500</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=70">KIA Sportage 2016</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">4400</td>
                                    <td style="text-align: center;">4300</td>
                                    <td style="text-align: center;">4200</td>
                                    <td style="text-align: center;">4100</td>
                                    <td style="text-align: center;">4000</td>
                                    <td style="text-align: center;">3900</td>
                                    <td style="text-align: center;">15000</td>
                                    <td style="text-align: center;">800</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=69">KIA Optima</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">5500</td>
                                    <td style="text-align: center;">5400</td>
                                    <td style="text-align: center;">5300</td>
                                    <td style="text-align: center;">5200</td>
                                    <td style="text-align: center;">5100</td>
                                    <td style="text-align: center;">5000</td>
                                    <td style="text-align: center;">30000</td>
                                    <td style="text-align: center;">900</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;"><a href="/index.php?route=product/product&amp;path=59&amp;product_id=68">Lexus NX200</a>                                    </td>
                                    <td style="text-align: center;">Автомат</td>
                                    <td style="text-align: center;">6500</td>
                                    <td style="text-align: center;">6000</td>
                                    <td style="text-align: center;">5900</td>
                                    <td style="text-align: center;">5800</td>
                                    <td style="text-align: center;">5700</td>
                                    <td style="text-align: center;">5600</td>
                                    <td style="text-align: center;">30000</td>
                                    <td style="text-align: center;" id="close">1000</td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="header-fixed"></table>
                      </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

<?php if(!$mobile){ ?>
<script>
$(document).ready(function(){
  var tableOffset = $(".table-price").offset().top;
  var jQueryheader = $(".table-price > thead").clone();
  var jQueryfixedHeader = $(".header-fixed").append(jQueryheader);
  var bottable = $("#close").offset().top;
  $(".header-fixed").width($(".table-price").width());    
  
  $(window).bind("scroll", function() {
    var offset = $(this).scrollTop();
    
    if (offset >= tableOffset && jQueryfixedHeader.is(":hidden")  && offset < bottable) {
        jQueryfixedHeader.show();
        jQueryfixedHeader.toggleClass( "fixed-overflow" );
    } else if (offset < tableOffset || offset > bottable) {
        jQueryfixedHeader.hide();
        jQueryfixedHeader.removeClass( "fixed-overflow" );
    }
    
    $(".header-fixed td").each(function(index) {
        $(this).width(function() {
            return $(".table-price td").eq(index).width();
        });
    });
  });
});
</script>
<?php } ?>

<?php echo $footer; ?>