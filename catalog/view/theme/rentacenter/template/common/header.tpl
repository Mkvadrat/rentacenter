<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<?php if ($noindex) { ?>
<!-- OCFilter Start -->
<meta name="robots" content="noindex,nofollow" />
<!-- OCFilter End -->
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<!-- JQUERY UI -->
<script src="catalog/view/theme/rentacenter/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="catalog/view/theme/rentacenter/js/jquery-ui-1.12.1/jquery-ui.min.css">

<!-- TIMEPICKER -->
<script src="catalog/view/theme/rentacenter/js/timepicker/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="catalog/view/theme/rentacenter/js/timepicker/jquery.timepicker.css">

<!-- VALIDATE -->
<script src="catalog/view/theme/rentacenter/js/validate/dist/jquery.validate.min.js"></script>

<!-- Bootstrap -->
<link href="catalog/view/theme/rentacenter/css/bootstrap.min.css" rel="stylesheet">
<script src="catalog/view/theme/rentacenter/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="catalog/view/theme/rentacenter/css/reset.css">
<link rel="stylesheet" href="catalog/view/theme/rentacenter/css/fonts.css">
<link rel="stylesheet" href="catalog/view/theme/rentacenter/css/styles.css">
<link rel="stylesheet" href="catalog/view/theme/rentacenter/css/media.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-121308815-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-121308815-1');
</script>

<!-- FANCYBOX -->
<link rel="stylesheet" href="catalog/view/theme/rentacenter/js/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
<script type="text/javascript" src="catalog/view/theme/rentacenter/js/source/jquery.fancybox.pack.js?v=2.1.5"></script>
<link rel="stylesheet" href="catalog/view/theme/rentacenter/js/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
<script type="text/javascript" src="catalog/view/theme/rentacenter/js/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript" src="catalog/view/theme/rentacenter/js/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
<link rel="stylesheet" href="catalog/view/theme/rentacenter/js/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="catalog/view/theme/rentacenter/js/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- MMENU -->
<link type="text/css" rel="stylesheet" href="catalog/view/theme/rentacenter/css/demo.css" />
<link type="text/css" rel="stylesheet" href="catalog/view/theme/rentacenter/css/jquery.mmenu.all.css" />
<script type="text/javascript" src="catalog/view/theme/rentacenter/js/jquery.mmenu.all.js"></script>

<!-- SLIDER-PRO -->
<link href="catalog/view/theme/rentacenter/css/slider-pro.min.css" rel="stylesheet">
<script src="catalog/view/theme/rentacenter/js/jquery.sliderPro.min.js"></script>

<!-- SWEETALERT -->
<link href="catalog/view/theme/rentacenter/css/sweetalert.css" rel="stylesheet">
<script src="catalog/view/theme/rentacenter/js/sweetalert.min.js"></script>

<!-- MASKEDINPUT -->
<script src="catalog/view/theme/rentacenter/js/jquery.inputmask.bundle.min.js"></script>
<script src="catalog/view/theme/rentacenter/js/inputmask.date.extensions.js"></script>

<!-- TABLE_RESPONSSIVE -->
<script src="catalog/view/theme/rentacenter/js/jquery.floatThead.js"></script>

<!-- MAIN PAGE -->
<script src="catalog/view/theme/rentacenter/js/common.js"></script>

<!-- HTML5 for IE -->
<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" src="http://api-maps.yandex.ru/1.1/index.xml?key=AEOd_1sBAAAAosS_VAIAEIEYSdzxEhvc0IsAWM6hyjmQDxAAAAAAAAAAAAB8TsaSrXlUU65OvX-c_GpH3yh1iQ==&geocode=37.611347,55.7602;modules=traffic"></script>

<script type="text/javascript">
        $(function() {
           $(window).scroll(function() {
               if($(this).scrollTop() != 0) {
                   $('#toTop').fadeIn();
               } else {
                   $('#toTop').fadeOut();
               }
           });
           $('#toTop').click(function() {
               $('body,html').animate({scrollTop:0},800);
           });
       });
   </script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>

<body class="<?php echo $class; ?>">



    <div id="toTop" ><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></div>


    <div id="page">
        <div class="infoline">
            <div>
                <p><strong>Адрес:</strong> 344092, г.  Ростов-на-Дону, пр-т Королёва, 7 оф. 230</p>
            </div>
            <div>
                <a href="email:info@rentacentr.ru"><i class="fa fa-envelope" aria-hidden="true"></i> info@rentacentr.ru</a>
            </div>
        </div>

        <div class="header">

            <a href="#menu"><span></span></a>

        </div>

        <nav id="menu">

            <ul>

                <li><a href="<?php echo $servises; ?>"><?php echo $text_services; ?></a></li>

                <li><a href="<?php echo $without_driver; ?>">Прокат авто без водителя</a></li>

                <li><a href="<?php echo $rental_airport; ?>">Прокат авто в аэропорту</a></li>

                <li><a href="<?php echo $conditions; ?>"><?php echo $text_conditions; ?></a></li>

                <li><a href="<?php echo $rates; ?>"><?php //echo $text_rates; ?>Цены</a></li>

                <li><a href="<?php echo $cars; ?>"><?php echo $text_cars; ?></a></li>

                <li><a href="<?php echo $news; ?>">Акции</a></li>

                <!-- <li><a href="<?php //echo $cooperation; ?>"><?php //echo $text_cooperation; ?></a></li> -->

                <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>

            </ul>

        </nav>



        <!-- start header-desctop -->



        <header class="header-desctop">

            <div class="container-fluid">

                <div class="block-header">      

                    <!--<a href="index.html" class="logo"><img src="catalog/view/theme/rentacenter/images/logo.png" alt=""></a>-->

                    

                    <!-- <?php if ($logo) { ?>

                        <a href="<?php echo $home; ?>" class="logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>

                    <?php } else { ?>

                        <h1 class="logo"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>

                    <?php } ?> -->



                    <a href="<?php echo $home; ?>" class="logo-text">

                        <?php echo $comment; ?>

                        <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />

                    </a>



                    <div class="header-phones">

                        <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>

                        <a href="tel:<?php echo $mobile; ?>"><?php echo $mobile; ?></a>

                        <a href="viber://chat?number=+79889906359" class="massenger"><img src="/catalog/view/theme/rentacenter/images/viber.png"></a>
                        <a href="https://wa.me/79889906359" class="massenger"><img src="/catalog/view/theme/rentacenter/images/WApp.png"></a>

                    </div>



                    <a href="<?php echo $booking; ?>" class="button-yellow">Заявка</a>

                    

                    <!-- <button type="button" class="menu-button hidden-lg"><i class="fa fa-bars"></i></button> -->

                    <div class="block-menu">

                        <ul class="menu-desctop">

                            <li><a href="<?php echo $servises; ?>"><?php echo $text_services; ?></a>

                                <ul class="dropdown">

                                    <li><a href="<?php echo $without_driver; ?>">Прокат авто без водителя</a></li>

                                    <li><a href="<?php echo $rental_airport; ?>">Прокат авто в аэропорту</a></li>

                                </ul>

                            </li>

                            <li><a href="<?php echo $conditions; ?>"><?php echo $text_conditions; ?></a></li>

                            <li><a href="<?php echo $rates; ?>"><?php //echo $text_rates; ?>Цены</a></li>

                            <li><a href="<?php echo $cars; ?>"><?php echo $text_cars; ?></a>
                                <ul class="dropdown">
                                  <li><a href="<?php echo $auto_a; ?>">Chevrolet Aveo</a></li>
                                  <li><a href="<?php echo $auto_b; ?>">Chevrolet Lacetti</a></li>
                                  <li><a href="<?php echo $auto_c; ?>">Ford Fiesta</a></li>
                                  <li><a href="<?php echo $auto_d; ?>">Ford Focus</a></li>
                                  <li><a href="<?php echo $auto_e; ?>">Honda Accord</a></li>
                                  <li><a href="<?php echo $auto_f; ?>">Honda Civic</a></li>
                                  <li><a href="<?php echo $auto_g; ?>">Hyundai Elantra</a></li>
                                  <li><a href="<?php echo $auto_h; ?>">Hyundai Solaris</a></li>
                                  <li><a href="<?php echo $auto_i; ?>">Kia Optima</a></li>
                                  <li><a href="<?php echo $auto_k; ?>">Kia Sportage 2016</a></li>
                                  <li><a href="<?php echo $auto_l; ?>">Lexus NX200</a></li>
                                  <li><a href="<?php echo $auto_m; ?>">Mazda 3</a></li>
                                  <li><a href="<?php echo $auto_n; ?>">Mazda 6</a></li>
                                  <li><a href="<?php echo $auto_o; ?>">Mitsubishi Lancer</a></li>
                                  <li><a href="<?php echo $auto_p; ?>">Renault Logan</a></li>
                                  <li><a href="<?php echo $auto_r; ?>">Skoda Fabia</a></li>
                                  <li><a href="<?php echo $auto_s; ?>">Skoda Octavia</a></li>
                                  <li><a href="<?php echo $auto_t; ?>">Toyota Camry</a></li>
                                  <li><a href="<?php echo $auto_u; ?>">Toyota Corola</a></li>
                                  <li><a href="<?php echo $auto_v; ?>">Volkswagen Passat</a></li>
                                  <li><a href="<?php echo $auto_w; ?>">Volkswagen Polo</a></li>
                              </ul>
                            </li>

                            <li><a href="<?php echo $news; ?>">Акции</a></li>

                            <!--<li><a href="<?php //echo $cooperation; ?>"><?php //echo $text_cooperation; ?></a></li>-->

                            <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
                            <li><a href="<?php echo $reviews_guest; ?>">Гостевая книга</a></li>
                            

                        </ul>

                    </div>

                    

                    <?php echo $language; ?>

                </div>

            </div>

        </header>



        <!-- end header-desctop -->