<cfinclude  template="user_header.cfm">
<div class="header">
		<div class="logo">
			<h1>BOOK YOUR <h1> 
			<h1>TICKET FOR <span>MOVIE</span></h1>
			<p class="slide-text">Safe, Secure,reliable ticketing.Your ticket to live entertainment!</p>
		</div>
		<div class="search">
			<h4>ARE YOU LOOKING FOR A MOVIE</h4>
			<div class="search2">						
				<form>
					<i class="fa fa-search"></i>
					<input type="text" value="Search for a movie" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a movie';}"/>
				</form>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>	        
    <div class="clearfix"></div>
	<div class="footer-top-grid">
		<div class="list-of-movies col-md-12">
			<div class="featured">
				<div class="showing-title">
					<button class="btn btn-showing featured_btn">Now Showing</button>
					<h4>MOVIES</h4>
					<p class="text-white">Be sure not to miss these movies today</p>
				</div>
				<cfset now_res=application.show.nowDetails()>
				<div class="container">					
				<div id="carouselExampleControls" class="carousel " data-bs-ride="carousel">
					<div class="carousel-inner">								
						<cfoutput>
							<cfloop query='now_res'>
								<div class="carousel-item active">
									<a href="movie-details.cfm?id=#toBase64(m_id)#" class="movie_link">									
										<div class="card" >
											<div class="image-warpper">
												<img src="uploads/#poster#" class="d-block w-100" alt="...">
											</div>
											<div class="card-body ">
												<h5 class="card-title text-center">#movie_name#</h5>
												<p><span><i class="fa-solid fa-hourglass px-3"></i></span>#duration#</p>
												<p><i class="fa-solid fa-masks-theater px-3"></i>#genre#</p>
											</div>
										</div>
									</a>										
								</div>	
							</cfloop>					
						</cfoutput>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="featured">
			<div class="showing-title">
				<button class="btn btn-showing featured_btn">Coming Soon</button>
				<h4>MOVIES</h4>
				<p class="text-white">Be sure not to miss these Upcoming Movies</p>
			</div>
			<cfset coming_res=application.show.comingDetails()>	
			<div class="container">		
				<div id="carouselComingDetails" class="carousel " data-bs-ride="carousel">
					<div class="carousel-inner carousel-coming">								
						<cfoutput>
							<cfloop query='coming_res'>
								<div class="carousel-item active">
									<a href="movie-details.cfm" class="movie_link">											
									<div class="card" >
										<div class="image-warpper">
											<img src="uploads/#poster#" class="d-block w-100" alt="...">
										</div>
										<div class="card-body">
											<h5 class="card-title text-center">#movie_name#</h5>
											<p><i class="fa-solid fa-hourglass px-3"></i>#duration#</p>
											<p><i class="fa-solid fa-masks-theater px-3"></i>#genre#</p>
										</div>
									</div>
									</a>										
								</div>	
							</cfloop>					
						</cfoutput>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselComingDetails" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselComingDetails" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>        
	<div class="col-md-12">
		<div class="featured">
			<div class="showing-title">
				<button class="btn btn-showing featured_btn">All</button>
				<h4>MOVIES</h4>
				<p class="text-white">Be sure not to miss these Movies in Theatres Now</p>
			</div>
			<cfset all_res=application.show.allDetails()>
			<div class="container">					
				<div id="carouselAllDetails" class="carousel " data-bs-ride="carousel">
					<div class="carousel-inner">								
						<cfoutput>
							<cfloop query='all_res'>
								<div class="carousel-item active">
									<a href="movie-details.cfm" class="movie_link">										
										<div class="card" >
											<div class="image-warpper">
												<img src="uploads/#poster#" class="d-block w-100" alt="...">
											</div>
											<div class="card-body">
												<h5 class="card-title text-center">#movie_name#</h5>
												<p><i class="fa-solid fa-hourglass px-3"></i>#duration#</p>
												<p><i class="fa-solid fa-masks-theater px-3"></i>#genre#</p>
											</div>
										</div>
									</a>										
								</div>	
							</cfloop>					
						</cfoutput>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselAllDetails" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselAllDetails" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>	
			</div>				
		</div>
	</div>            
	<div class="clearfix"></div>	
	<div class="footer">			
		<div class="clearfix"></div>
		<div class="col-md-12 subscribe_div ">
			<div class="subscribe-form">
				<div class="subscribe_head text-center">
					<h5 class="sub_text">SUBSCRIBE TO BOOKMYTICKET</h5>
					<h2 class="text-white p-3">TO GET EXCLUSIVE BENEFITS</h2>
				</div>
				<div class="row p-3">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<input type="text" class="text form-control" name="email_id" placeholder="Enter Email Id">
					</div>
					<div class="col-md-4">
						<input type="submit" value="Subscribe" class="btn btn-showing" name="subscribe">
					</div>
					<div class="col-md-4"></div>
				</div>
				<div class="clearfix"></div>
			</div>		
		</div>			
		<div class="clearfix"></div>	
		<div class="clearfix"></div>
		<div class="follow-us">	
			<div class="footer-brand text-center text-white">
				<i class="fa-solid fa-ticket"></i>
				<h6 >BookMyTicket</h6>
			</div>		
			<ul class="social-icons">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-youtube"></i></a></li>
				<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			</ul>			
			<div class="clearfix"></div>
		</div>
	</div>
<cfinclude  template="user_footer.cfm">			