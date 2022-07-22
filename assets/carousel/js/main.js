$(function() {

	if ( $('.owl-2').length > 0 ) {
      var cast_num=$('#cast_num').val();
      
        $('.owl-2').owlCarousel({
            center: false,
            items:1,
            loop: true,
            stagePadding: 0,
            margin: 20,
            smartSpeed: 1000,
            autoplay: true,
            nav: true,
            dots: true,
            pauseOnHover: false,
            responsive:{
                600:{
                    margin: 20,
                    nav: true,
                  items: cast_num
                },
                1000:{
                    margin: 20,
                    stagePadding: 0,
                    nav: true,
                  items: cast_num
                }
            }
        });            
    }

    if ( $('.owl-3').length > 0 ) {
       var crew_num=$('#crew_num').val();
        $('.owl-3').owlCarousel({
            center: false,
            items: 0,
            loop: true,
            stagePadding: 0,
            margin: 20,
            smartSpeed: 1000,
            autoplay: true,
            nav: true,
            dots: true,
            pauseOnHover: false,
            responsive:{
                600:{
                    margin: 20,
                    nav: true,
                  items: crew_num
                },
                1000:{
                    margin: 20,
                    stagePadding: 0,
                    nav: true,
                  items: crew_num
                }
            }
        });            
    }

})