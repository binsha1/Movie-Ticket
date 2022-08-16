<cfinclude  template="user_header.cfm">
<cfparam  name="date" default="#dateFormat(now(),'yyyy-mm-dd')#">
<cfset pdate=toString(toBinary(date))>
<cfset showId=toString(toBinary(id))>
<cfset movId=toString(toBinary(mid))>
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
						<a href="##"><i class="fa fa-map-marker"></i>#theatre_name#</a>
					</li>
					<cfset time_res=application.show.getTimeSlots(th_id,m_id,pdate)>
					<cfloop index="i" array="#time_res#">
						<li class="time">								
							<button type="button" class="btn btn-primary seat_slot" data-bs-toggle="modal" data-id="#i.sh_id#" data-bs-target=".loginModal"  >#timeformat(i.start_time)#</button>
						</li>
					</cfloop>						
				</cfoutput>
			</ul>
		</div>
	</div>
</div>
<cfinclude  template="modals/login_seat.cfm">
<cfinclude  template="user_footer.cfm">


