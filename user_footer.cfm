</div>
<div class="copy-rights text-center">
	<p><span>Copyright &copy; Book My Ticket 2022</span></p>
</div>			
<script type="text/javascript">
    $(document).ready(function() {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear' 
        };
        */        
        $().UItoTop({ easingType: 'easeOutQuart' });        
    });
</script>
<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/custom.js"></script>	
<script src="assets/js/autocomplete.js"></script>	
<script src="assets/js/select2.min.js"></script>
<!-- Modernizr --> 
<script src="assets/user_template/seat/js/modernizr.custom.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/carousel/js/owl.carousel.min.js"></script>
<script src="assets/carousel/js/main.js"></script>
<!-- FlexSlider -->
<script defer src="assets/user_template/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="assets/user_template/css/flexslider.css" type="text/css" media="screen" />
<script type="text/javascript">
    $(function(){
    SyntaxHighlighter.all();
    });
    $(window).load(function(){
    $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
        $('body').removeClass('loading');
        }
    });
    });
</script>
<script src="assets/user_template/js/responsive-tabs.js"></script>
<script type="text/javascript">
    $( '#myTab a' ).click( function ( e ) {
    e.preventDefault();
    $( this ).tab( 'show' );
    } );

    $( '#moreTabs a' ).click( function ( e ) {
    e.preventDefault();
    $( this ).tab( 'show' );
    } );

    ( function( $ ) {
        // Test for making sure event are maintained
        $( '.js-alert-test' ).click( function () {
        alert( 'Button Clicked: Event was maintained' );
        } );
        fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
    } )( jQuery );
</script>  
<script>

    var multipleCardCarousel = document.querySelector(
    "#carouselExampleControls"
    );
    if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel = new bootstrap.Carousel(multipleCardCarousel, {
        interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#carouselExampleControls .carousel-control-next").on("click", function () {
        if (scrollPosition < carouselWidth - cardWidth * 4) {
        scrollPosition += cardWidth;
        $("#carouselExampleControls .carousel-inner").animate(
            { scrollLeft: scrollPosition },
            600
        );
        }
    });
    $("#carouselExampleControls .carousel-control-prev").on("click", function () {
        if (scrollPosition > 0) {
        scrollPosition -= cardWidth;
        $("#carouselExampleControls .carousel-inner").animate(
            { scrollLeft: scrollPosition },
            600
        );
        }
    });
    } else {
    $(multipleCardCarousel).addClass("slide");
    }
    <!---   All Card Carousel ---->
    var allCardCarousel = document.querySelector(
    "#carouselAllDetails"
    );
    if (window.matchMedia("(min-width: 768px)").matches) {
    var all_carousel = new bootstrap.Carousel(allCardCarousel, {
        interval: false,
    });
    var allCarouselWidth = $(".carousel-inner")[2].scrollWidth;
    var allCardWidth = $(".carousel-item").width();
    var allScrollPosition = 0;
    $("#carouselAllDetails .carousel-control-next").on("click", function () {
        if (allScrollPosition < allCarouselWidth - allCardWidth * 4) {
        allScrollPosition += allCardWidth;
        $("#carouselAllDetails .carousel-inner").animate(
            { scrollLeft: allScrollPosition },
            600
        );
        }
    });
    $("#carouselAllDetails .carousel-control-prev").on("click", function () {
        if (allScrollPosition > 0) {
        allScrollPosition -= allCardWidth;
        $("#carouselAllDetails .carousel-inner").animate(
            { scrollLeft: allScrollPosition },
            600
        );
        }
    });
    } else {
    $(allCardCarousel).addClass("slide");
    }
    <!-------------------   Coming  Card Carousel -------------->
    var comingCardCarousel = document.querySelector(
    "#carouselComingDetails"
    );
    if (window.matchMedia("(min-width: 768px)").matches) {
    var coming_carousel = new bootstrap.Carousel(comingCardCarousel, {
        interval: false,
    });
    var comingCarouselWidth = $(".carousel-inner")[1].scrollWidth;
    var comingCardWidth = $(".carousel-item").width();
    var comingScrollPosition = 0;
    $("#carouselComingDetails .carousel-control-next").on("click", function () {
        if (comingScrollPosition < comingCarouselWidth - comingCardWidth * 4) {
        comingScrollPosition += comingCardWidth;
        $("#carouselComingDetails .carousel-inner").animate(
            { scrollLeft: comingScrollPosition },
            600
        );
        }
    });
    $("#carouselComingDetails .carousel-control-prev").on("click", function () {
        if (comingScrollPosition > 0) {
        comingScrollPosition -=comingCardWidth ;
        $("#carouselComingDetails .carousel-inner").animate(
            { scrollLeft: comingScrollPosition },
            600
        );
        }
    });
    } else {
    $(comingCardCarousel).addClass("slide");
    }
</script>
<script>window.jQuery || document.write('<script src="assets/user_template/seat/js/jquery-3.1.1.min.js"><\/script>')</script>
<!-- Migrate --> 
<script src="assets/user_template/seat/js/jquery-migrate-1.2.1.min.js"></script>
<!-- Bootstrap 3-->      
<!-- Mobile menu -->
<script src="assets/user_template/seat/js/jquery.mobile.menu.js"></script>
<!-- Select -->
<script src="assets/user_template/seat/js/jquery.selectbox-0.2.min.js"></script>
<!-- Form element -->
<script src="assets/user_template/seat/js/form-element.js"></script>
<script src="assets/user_template/seat/js/form.js"></script>
<!-- Form validation -->
<!-- Custom -->
<script src="assets/user_template/seat/js/custom.js"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/user_template/seat/js/script.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        init_BookingTwo();
    });
</script>
</body>
</html>
