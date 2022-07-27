<cfinclude  template="user_header.cfm">
<cfparam  name="date" default="#dateFormat(now(),'yyyy-mm-dd')#">
<cfset showId=toString(toBinary(id))>

<cfset movId=toString(toBinary(mid))>
<cfset pdate=toString(toBinary(date))>
<!---<cfset date_convert=parseDateTime(date_string)>
<cfset pdate=dateFormat(date_convert,"yyyy-mm-dd")>--->
<cfset mov_res=application.show.getMovieShows(movId,pdate)>
<cfset mov_details=application.movie.getMovie(movId)>
<cfset show_details=application.show.getShowDetails(showId)>
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
                    <h4 class="text-center text-white">Show Times for <cfoutput>#dateformat(pdate,"dd-mm-yyyy")#</cfoutput></h4>
                    <cfoutput query='mov_res'>
                    
					<li class="location">
						<a href="pic-a-movie.html"><i class="fa fa-map-marker"></i>#theatre_name#</a>
					</li>

					<li class="time">
						<!---<a href="components/controller.cfc?method=checkLogin">#start_time#</a>
                        --->
                        <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-id="0" data-bs-target=".loginModal"  >#start_time#</button>
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
<cfinclude  template="modals/login_seat.cfm">
<cfinclude  template="user_footer.cfm">


Status Update	            :  27-07-2022
Working on 	            :  Movie ticket
Task                             : Login Page Template Design|
								   Login Functionality| User SignUp Page Template Design|
								   User Sign Up Funtioanlity| 
								   Choosing Number of seats after Login Check
Task Completion        :  63%
ETA                             : 05-08-2022
Link                            : https://github.com/binsha1/Movie-Ticket.git