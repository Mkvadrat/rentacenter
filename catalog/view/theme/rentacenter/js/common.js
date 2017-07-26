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

	// FANCYBOX
    $(".fancybox").fancybox();

    // OWL-CAROUSEL
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        autoplay:true,
        smartSpeed:2000,
        autoplayTimeout:5000,
        dots:true,
        stopOnHover:true,
        navigationText:["",""],
        rewindNav:true,
        pagination:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });

    // MMENU

    $(function() {
        $('nav#menu').mmenu({
        	extensions	: [ 'fx-menu-slide', 'shadow-page', 'shadow-panels', 'listview-large', 'pagedim-black' ]
        });
    });

    // LANGUAGE-BUTTON

    $(".language-button").click(function() {
        $(".language-list .menu").slideToggle();
    });

});