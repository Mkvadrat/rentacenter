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
<script src="catalog/view/theme/rentacenter/js/jquery-1.9.1.min.js"></script>

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

<!-- FANCYBOX -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.js"></script> -->

<link rel="stylesheet" href="catalog/view/theme/rentacenter/js/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
<script type="text/javascript" src="catalog/view/theme/rentacenter/js/source/jquery.fancybox.pack.js?v=2.1.5"></script>
<!-- <script src="js/jquery.mousewheel-3.0.6.pack.js"></script> -->

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
    <div id="page">
        <div class="header">
            <a href="#menu"><span></span></a>
        </div>
        <nav id="menu">
            <ul>
                <li><a href="<?php echo $servises; ?>"><?php echo $text_services; ?></a></li>
                <li><a href="<?php echo $conditions; ?>"><?php echo $text_conditions; ?></a></li>
                <li><a href="<?php echo $rates; ?>"><?php echo $text_rates; ?></a></li>
                <li><a href="<?php echo $cars; ?>"><?php echo $text_cars; ?></a></li>
                <li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
                <!-- <ul class="drodown">
                    <li><a href="<?php echo $cooperation; ?>"><?php echo $text_cooperation; ?></a></li>
                    <li><a href="<?php echo $cooperation; ?>"><?php echo $text_cooperation; ?></a></li>
                    <li><a href="<?php echo $cooperation; ?>"><?php echo $text_cooperation; ?></a></li>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
                </ul> -->
            </ul>
        </nav>

        <!-- start header-desctop -->

        <header class="header-desctop">
            <div class="container-fluid">
                <div class="block-header">      
                    <!--<a href="index.html" class="logo"><img src="catalog/view/theme/rentacenter/images/logo.png" alt=""></a>-->
                    
                    <?php if ($logo) { ?>
                        <a href="<?php echo $home; ?>" class="logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                    <?php } else { ?>
                        <h1 class="logo"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>

                    <div class="header-phones">
                        <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
                        <a href="tel:<?php echo $mobile; ?>"><?php echo $mobile; ?></a>
                    </div>

                    <a href="<?php echo $booking; ?>" class="button-yellow">Забронировать авто</a>
                    
                    <!-- <button type="button" class="menu-button hidden-lg"><i class="fa fa-bars"></i></button> -->
                    <div class="block-menu">
                        <ul class="menu-desctop">
                            <li><a href="<?php echo $servises; ?>"><?php echo $text_services; ?></a></li>
                            <li><a href="<?php echo $conditions; ?>"><?php echo $text_conditions; ?></a></li>
                            <li><a href="<?php echo $rates; ?>"><?php echo $text_rates; ?></a></li>
                            <li><a href="<?php echo $cars; ?>"><?php echo $text_cars; ?></a></li>
                            <li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
                            <!--<li><a href="<?php echo $cooperation; ?>"><?php echo $text_cooperation; ?></a></li>-->
                            <li><a href="<?php echo $contact; ?>"><?php echo $text_contacts; ?></a></li>
                        </ul>
                    </div>
                    
                    <?php echo $language; ?>
                </div>
            </div>
        </header>

        <!-- end header-desctop -->