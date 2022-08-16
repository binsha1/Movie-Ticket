<cfparam  name="id" default="val">
<cfinclude  template="user_header.cfm">
<cfset movId=toString(toBinary(id))>
<cfset mov_res=application.movie.getMovie(movId)>
<cfset cast_res=application.movie.castDetails(movId)>
<cfset crew_res=application.movie.crewDetails(movId)>
<div class="container p-5">
	<cfoutput >
		<cfloop array="#mov_res#" index="i">			
			<div class="row">
				<img src="uploads/#i.wallpaper#" alt="" class="img-fluid mov_wall ">
				<div class="col-md-4 text-center mt-5">
					<img src="uploads/#i.poster#" alt="" class="img-fluid mov_image">
				</div>
				<div class="col-md-8 p-4">
					<div class="card_datails">
						<h1 class="text-white mov_title">#i.movie_name#</h1>
						<div class="card_cat">						
							<p class="year"> <i class="fa-solid fa-calendar-days"></i> #dateFormat('#i.release_date#','dd-mm-yyyy')#</p>
							<p class="genre"><i class="fa-solid fa-masks-theater px-3"></i> #i.genre# </p>
							<p class="time"><i class="fa-solid fa-hourglass px-3"></i> #i.duration#</p>
						</div>
						<div class='text-white'>
							<p class="text-dark"><span class="mfor">#i.movie_format#</span> <span class="mfor">#i.language#</span></p>
							<p class="disc pt-3 text-white">#i.description#</p>
						</div>
						<div class="social-btn pt-3">
							<!-- WATCH TRAILER-->
							<a href="#i.trailer_url#" class="btn btn-primary">
								<i class="fas fa-play"></i> TRAILER
							</a>
							<!-- GET-->
							<a href="show.cfm" class="btn btn-showing">
								<i class="fa-solid fa-ticket">
								</i> Book Ticket
							</a>
						</div>  
					</div>
				</div>
			</div>
		</cfloop>
	</cfoutput>
</div>
<div class="container cc_div mt-5">
	<div class="row pt-5 text-white">
		<h3>CAST</h3>
		<hr class="mt-3">
		<div class="site-section bg-left-half mb-5">
      		<div class="container owl-2-style">  
				<cfoutput>
					<input type="hidden" id="cast_num" value="#cast_res.RecordCount()#">  
				</cfoutput>
				<div class="owl-carousel owl-2">						
					<cfoutput query='cast_res'>
						<div class="media-29101">
							<img src="uploads/#actor_photo#" alt="Image" class="img-fluid scroll_image">
							<h3>#actor_name#</h3>
							<p>as #character_name#</p>
						</div>
					</cfoutput>
				</div>
      		</div>
   		</div>
  	</div>          
	<div class="row pt-5 text-white">
		<h3>CREW</h3> 
		<hr class="mt-3">
		<div class="site-section bg-left-half mb-5">
      		<div class="container owl-2-style">	
				<cfoutput>
					<input type="hidden" id="crew_num" value="#crew_res.RecordCount()#">  
				</cfoutput>
				<div class="owl-carousel owl-3">						
					<cfoutput query='crew_res'>						
						<div class="media-29101">
							<img src="uploads/#crew_photo#" alt="Image" class="img-fluid scroll_image">
							<h3>#person_name#</h3>
							<p>#role_name#</p>
						</div>
					</cfoutput>
				</div>
      		</div>
   		</div>          
	</div>
</div>
<cfinclude  template="user_footer.cfm">
