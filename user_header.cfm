<html>
<head>
<title>Book My Ticket</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link rel="stylesheet" href="assets/fontawesome/css/all.css">
<link href="assets/css/jquery-ui.css" rel="stylesheet" >
<link rel="stylesheet" href="assets/css/bootstrap.min.css"> 
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/select2.min.css">
<!-- Mobile menu
        <link href="assets/user_template/seat/css/gozha-nav.css" rel="stylesheet" /> -->
        <!-- Select -->
        <link href="assets/user_template/seat/css/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="assets/user_template/seat/css/style.css?v=1" rel="stylesheet" />
<link href="assets/user_template/seat/css/style_2.css" rel="stylesheet" />
        
<!--Custom Theme files -->
<link rel="stylesheet" href="assets/user_template/css/menu.css" />
<link href="assets/user_template/css/styles.css" rel="stylesheet" type="text/css" media="all" />


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='//fonts.googleapis.com/css?family=Oxygen:400,700,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

<!---Carousel Styles---->

<link rel="stylesheet" href="assets/carousel/fonts/icomoon/style.css">
<link rel="stylesheet" href="assets/carousel/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/carousel/css/owl.theme.default.min.css">
<!-- Bootstrap CSS
<link rel="stylesheet" href="assets/carousel/css/bootstrap.min.css"> -->
<!-- Style -->
<link rel="stylesheet" href="assets/carousel/css/style.css">

	<!-- start menu -->
<link href="assets/user_template/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="assets/user_template/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="assets/user_template/js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="assets/user_template/css/font-awesome.min.css" />
<script src="assets/user_template/js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
</script>
<script type="text/javascript" src="assets/user_template/js/move-top.js"></script>
<script type="text/javascript" src="assets/user_template/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script><!---- start-smoth-scrolling---->
<style>



</style>
</head>
<body class="user_body">
<div class="main-content">
	<div class="bootstrap_container" id="home">
		<nav class="navbar navbar-expand-lg user_nav">
			<div class="container-fluid">
				<i class="fa-solid fa-film icon_theatre"></i>
				<a class="navbar-brand text-white" href="index.cfm">BookMyTicket</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link active text-white" aria-current="page" href="index.cfm">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="show.cfm">Shows</a>
						</li>
						<li class="nav-item">
							<a class="nav-link"  href="#">About Us</a>
						</li>
						<li class="nav-item">
							<a class="nav-link"  href="contact-us.cfm">Contact Us</a>
						</li>
					</ul>
					<ul class="navbar-nav ms-auto">
							
						<cfif structKeyExists(session, "userLog")>
							<li class="nav-item">
							<a class="nav-link "  ><p class="text-show">Welcome,You are In</p></a>
						</li>
							<div class="dropdown">
								<a class="btn btn-showing dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								<cfoutput>
									#session.userLog.user_name#
								</cfoutput>
								</a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<li><a class="dropdown-item" href="view_bookings.cfm">Bookings</a></li>
									
									<li><a class="dropdown-item" href="components/controller.cfc?method=userLogout">Logout <i class="fa-solid fa-right-from-bracket"></i></a></li>
								</ul>
							</div>

						
						<cfelse>
						<li><a href="signup.cfm" class="nav-link signup_btn"> Sign Up</a></li>
						<li><a href="login.cfm" class="nav-link signin_btn"> Login</a></li>
						</cfif>
		
		
		
					</ul>						
				</div>
			</div>
		</nav>				
	</div>


