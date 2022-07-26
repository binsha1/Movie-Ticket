<cfinclude  template="user_header.cfm">
<cfset movId=toString(toBinary(id))>
<cfset pdate=toString(toBinary(date))>
<!---<cfset date_convert=parseDateTime(date_string)>
<cfset pdate=dateFormat(date_convert,"yyyy-mm-dd")>--->
<cfset mov_res=application.show.getMovieShows(movId,pdate)>
<cfset mov_details=application.movie.getMovie(movId)>
<div class="container">
    <cfoutput >
    <cfloop array="#mov_details#" index="i">
        <img src="uploads/#i.wallpaper#" alt="" class="img-fluid ">
        </cfloop>
    </cfoutput>
    
</div>
<div class="row th_list p-3">
<div class="col-md-12 movies-dates">	
        
			<div class="movie-date-selection">
				<ul>
                    
                    <cfoutput query='mov_res'>
                    
					<li class="location">
						<a href="pic-a-movie.html"><i class="fa fa-map-marker"></i>#theatre_name#</a>
					</li>

					<li class="time">
						<a href="components/controller.cfc?method=checkLogin">#start_time#</a>
                        
					</li>
					<!---<li class="time">
						<a href="movie-payment.html">3:00 PM</a>
					</li>
					<li class="time">
						<a href="movie-payment.html">6:20 PM</a>
					</li>
					<li class="time">
						<a href="movie-payment.html">9:00 PM</a>
					</li>---->
                    </cfoutput>
				</ul>
			</div>
</div>
</div>

<cfinclude  template="user_footer.cfm">