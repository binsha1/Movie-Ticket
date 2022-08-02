<cfset movieDetails=application.movie.movieDetails()>
<cfset now_res=application.show.nowDetails()>
<cfset coming_res=application.show.comingDetails()>
<cfset all_res=application.show.allDetails()>	
<cfinclude  template="user_header.cfm">
<div class="header">
    <div class="logo">
        <h1>BOOK YOUR <h1> 
        <h1>TICKET FOR <span>MOVIE</span></h1>
        <p class="slide-text">Safe, Secure,reliable ticketing.Your ticket to live entertainment!</p>
    </div>
    <div class="search">
        <h4 class="text-center">ARE YOU LOOKING FOR A MOVIE</h4>
        <div class="p-3">	
            <form action='components/movie.cfc?method=searchMovie' method="post" class="col-lg-6 offset-lg-3">
                <div class='input-group mb-3'>
                
                    <select class="js-example-basic-single form-control required" name='movie_id' required>
                        <option value="default">Search For a Movie</option>
                        <cfoutput query='movieDetails'>
                            <option value="#id#">
                                    #movie_name#
                                    </option>
                            </cfoutput>             
                    </select>
                    
                    <!---
                    <div class='input-group mb-3'>
                    <input aria-describedby='button-addon2' aria-label='Country' class='form-control autocomplete' id='mov_input'
                    name='movie' placeholder='Search for a movie' type='text' >--->
                    <div class='input-group-append'>
                        <input class='btn btn-outline-primary' id='button-addon2' name="submit" value="Ok" type='submit'>
                    </div>
                </div>
            </form>
            <div class="col-md-5" style="position: relative;margin-top: -38px;margin-left: 215px;">
                    <div class="list-group" id="show-list">
                    <!-- Here autocomplete list will be display -->
                </div>
            </div>
            <!---<form autocomplete="off" action="components/movie.cfc?method=searchMovie">
                <i class="fa fa-search"></i>
                <input type="text" value="" placeholder="Search for a movie" name="movie" class="form-control" id="mov_input"/>
                <input type="submit" value="submit" name="submit" class="btn btn-primary">
            </form>--->
        </div>
    </div>
    <div class="clearfix"></div>
</div>	        
<div class="clearfix"></div>
	<section class="ftco-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="heading-section mb-5 pb-md-4">Carousel #07</h2>
					</div>
					<div class="col-md-12">
						<div class="featured-carousel owl-carousel">
							<div class="item">
								<div class="blog-entry">
		              <a href="#" class="block-20 d-flex align-items-start" style="background-image: url('uploads/b2.jpg');">
										<div class="meta-date text-center p-2">
		                  <span class="day">26</span>
		                  <span class="mos">Nov.</span>
		                  <span class="yr">2019</span>
		                </div>
		              </a>
		              <div class="text border border-top-0 p-4">
		                <h3 class="heading"><a href="#">Finance And Legal Working Streams Occur Throughout</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <div class="d-flex align-items-center mt-4">
			                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
			                <p class="ml-auto meta2 mb-0">
			                	<a href="#" class="mr-2">Admin</a>
			                	<a href="#" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>
			                </p>
		                </div>
		              </div>
		            </div>
							</div>

							<div class="item">
								<div class="blog-entry">
		              <a href="#" class="block-20 d-flex align-items-start" style="background-image: url('images/image_2.jpg');">
										<div class="meta-date text-center p-2">
		                  <span class="day">26</span>
		                  <span class="mos">Nov.</span>
		                  <span class="yr">2019</span>
		                </div>
		              </a>
		              <div class="text border border-top-0 p-4">
		                <h3 class="heading"><a href="#">Finance And Legal Working Streams Occur Throughout</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <div class="d-flex align-items-center mt-4">
			                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
			                <p class="ml-auto meta2 mb-0">
			                	<a href="#" class="mr-2">Admin</a>
			                	<a href="#" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>
			                </p>
		                </div>
		              </div>
		            </div>
							</div>

							<div class="item">
								<div class="blog-entry">
		              <a href="#" class="block-20 d-flex align-items-start" style="background-image: url('uploads/b2.jpg');">
										<div class="meta-date text-center p-2">
		                  <span class="day">26</span>
		                  <span class="mos">Nov.</span>
		                  <span class="yr">2019</span>
		                </div>
		              </a>
		              <div class="text border border-top-0 p-4">
		                <h3 class="heading"><a href="#">Finance And Legal Working Streams Occur Throughout</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <div class="d-flex align-items-center mt-4">
			                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
			                <p class="ml-auto meta2 mb-0">
			                	<a href="#" class="mr-2">Admin</a>
			                	<a href="#" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>
			                </p>
		                </div>
		              </div>
		            </div>
							</div>

							<div class="item">
								<div class="blog-entry">
		              <a href="#" class="block-20 d-flex align-items-start" style="background-image: url('images/image_4.jpg');">
										<div class="meta-date text-center p-2">
		                  <span class="day">26</span>
		                  <span class="mos">Nov.</span>
		                  <span class="yr">2019</span>
		                </div>
		              </a>
		              <div class="text border border-top-0 p-4">
		                <h3 class="heading"><a href="#">Finance And Legal Working Streams Occur Throughout</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <div class="d-flex align-items-center mt-4">
			                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
			                <p class="ml-auto meta2 mb-0">
			                	<a href="#" class="mr-2">Admin</a>
			                	<a href="#" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>
			                </p>
		                </div>
		              </div>
		            </div>
							</div>

							<div class="item">
								<div class="blog-entry">
		              <a href="#" class="block-20 d-flex align-items-start" style="background-image: url('images/image_5.jpg');">
										<div class="meta-date text-center p-2">
		                  <span class="day">26</span>
		                  <span class="mos">Nov.</span>
		                  <span class="yr">2019</span>
		                </div>
		              </a>
		              <div class="text border border-top-0 p-4">
		                <h3 class="heading"><a href="#">Finance And Legal Working Streams Occur Throughout</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <div class="d-flex align-items-center mt-4">
			                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
			                <p class="ml-auto meta2 mb-0">
			                	<a href="#" class="mr-2">Admin</a>
			                	<a href="#" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>
			                </p>
		                </div>
		              </div>
		            </div>
							</div>

							<div class="item">
								<div class="blog-entry">
		              <a href="#" class="block-20 d-flex align-items-start" style="background-image: url('images/image_6.jpg');">
										<div class="meta-date text-center p-2">
		                  <span class="day">26</span>
		                  <span class="mos">Nov.</span>
		                  <span class="yr">2019</span>
		                </div>
		              </a>
		              <div class="text border border-top-0 p-4">
		                <h3 class="heading"><a href="#">Finance And Legal Working Streams Occur Throughout</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <div class="d-flex align-items-center mt-4">
			                <p class="mb-0"><a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
			                <p class="ml-auto meta2 mb-0">
			                	<a href="#" class="mr-2">Admin</a>
			                	<a href="#" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>
			                </p>
		                </div>
		              </div>
		            </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	      
	          
	
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