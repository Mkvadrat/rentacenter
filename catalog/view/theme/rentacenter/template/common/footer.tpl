    <!-- start footer -->
    
    <footer class="footer">
    
        <div class="container-fluid start-now">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p class="title"><span>Начните прямо сейчас,</span> забронируйте автомобиль через наш сервис</p>
                        <div class="buttons-block">
                            <a href="<?php echo $autopark; ?>">автопарк</a>
                            <a href="<?php echo $booking; ?>">забронировать авто</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="container-fluid midle-footer-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <a href="<?php echo $servises; ?>" class="title">О кампании avto prokat</a>
                        <div class="logo-social-block">
                            
                            <!-- <?php if ($logo) { ?>
                                 <a href="<?php echo $home; ?>"  class="logo-footer"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                             <?php } else { ?>
                                 <h1  class="logo-footer"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                             <?php } ?> -->

                             <a href="<?php echo $home; ?>" class="logo-text-footer">
                                <?php echo $comment; ?>
                                <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                            </a>
                             
                            <!--<a href="index.html" class="logo-footer"><img src="images/logo.png" alt=""></a>-->
                            <ul class="social-list">
                                <li><a href="<?php echo $facebook; ?>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="<?php echo $twitter; ?>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="<?php echo $linkedin; ?>"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <p><?php echo $footer_text; ?></p>
                    </div>
                    <div class="col-md-4">
                        <a href="<?php echo $contact; ?>" class="title">Контакты</a>
                        <p><?php echo $contacts_text; ?></p>
                        <address>
                            <p><a href="tel:<?php echo $telephone; ?>"><i class="fa fa-phone-square" aria-hidden="true"></i> <?php echo $telephone; ?></a></p>
                            <p><a href="tel:<?php echo $mobile; ?>"><i class="fa fa-mobile" aria-hidden="true"></i> <?php echo $mobile; ?></a> (Viber, WhatsUp)</p>
                            <!--<p><a href="tel:<?php //echo $fax; ?>"><i class="fa fa-fax" aria-hidden="true"></i> <?php //echo $fax; ?></a></p>-->
                            <p><a href="email:<?php echo $email; ?>"><i class="fa fa-envelope" aria-hidden="true"></i> <?php echo $email; ?></a></p>
                        </address>
                    </div>
                    <?php if($news_list){ ?>
                    <div class="col-md-4">
                        <a href="<?php echo $news; ?>" class="title">Акции</a>
                        <ul class="list-news">
                            <?php foreach($news_list as $list){ ?>
                            <li>
                                <p><?php echo $list['title']; ?><a href="<?php echo $list['href']; ?>"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></p>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    
        <div class="container-fluid bottom-footer-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>Copyright &#169; 2017 avto prokat. все права защищены. сайт сделан в <a href="http://mkvadrat.com/">м2</a></p>
                    </div>
                </div>
            </div>
        </div>
    
    </footer>
    <!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter43471714 = new Ya.Metrika({
                    id:43471714,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/43471714" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-103702585-2', 'auto');
  ga('send', 'pageview');

</script>

    <!-- end footer -->
    
    </div>

<script>
$(function () {                                      
    $('.menu-desctop li a').each(function () {             
        var location = window.location.href; 
        var link = this.href;                
        if(location == link) {               
            $(this).addClass('active');  
        }
    });
});
</script>

<script>
function sendFullForm(){
	$.ajax({
		url: 'index.php?route=common/footer/sendFullForm',
		type: 'post',
		data: {  
            'name' : $('#name_contact_page').val(),
            'tel' : $('#tel_contact_page').val(),
            'email' : $('#email_contact_page').val(),
			'question' : $('#question_contact_page').val(),
        },
		dataType: 'json',
		success: function(data) {
			swal(data.message);
		}
	});
}
</script>

</body></html>