<cfinclude  template="user_header.cfm">
<cfset t_date=toBase64(DateFormat(Now(),"yyyy-mm-dd"))>
<cfset today_date=parseDateTime(toString(toBinary(t_date)))>
<cfparam name="cdate" default="#DateFormat(Now(),"yyyy-mm-dd")#">
<cfset fromDate = Now()+2> 
<cfset toDate = Now() + 5>
<cfset today_movies=application.show.showDate(today_date)> 
<div class="container p-5">
	<ul class="nav nav-pills justify-content-center" >
		<cfoutput>
			<li class="nav-item">
				<a class="nav-link date-nav text-uppercase"  href="components/show.cfc?method=getMovieDate&date=#DateFormat(Now(),"yyyy-mm-dd")#">
					#dateformat(Now(), "dd")#<br>
					Today
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link date-nav text-uppercase"  href="components/show.cfc?method=getMovieDate&date=#DateFormat(Now()+1,"yyyy-mm-dd")#">
					#dateformat(Now()+1, "dd")#<br>
					Tmrw
				</a>
			</li>
			<cfloop from="#fromDate#" to="#toDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#"> 
				<li class="nav-item">
					<a class=" nav-link date-nav text-uppercase"  href="components/show.cfc?method=getMovieDate&date=#DateFormat(i,"yyyy-mm-dd")#">
						#dateformat(i, "dd")#<br>
						#dateformat(i, "ddd")#
					</a>
				</li>
			</cfloop>
		</cfoutput>
	</ul>
  	<!-- Tab panes -->
  	<div class="tab-content">
    	<div id="home_pill" class="container tab-pane active"><br>	
			<cfif cdate EQ today_date>
				<table class="table table-striped now_table ">
					<tbody>
						<cfoutput query='today_movies'>
							<cfset movId=toBase64(m_id)> 
							<tr>
								<td><a href="movie-details.cfm?id=#movId#"><img src="uploads/#poster#" class="img-fluid img-now"></a></td>
								<td>
									<table class="table table-borderless">
										<tr>
											<th>Movie Name</th>
											<th>Genre</th>
											<th>Release Date</th>
											<th>Book Ticket</th>
											<th>Watch Trailer</th>
										</tr>								
										<tr>
										
											<td>#movie_name#</td>
											<td>#genre#</td>
											<td>#DateFormat(release_date,"mmmm dd, yyyy")#</td>
											<td><a href="book-ticket.cfm?id=#toBase64(id)#&mid=#toBase64(m_id)#&date=#toBase64(cdate)#" class="btn btn-showing">
												<i class="fa-solid fa-ticket"></i> Book Ticket
												</a></td>
											<td><a href="#trailer_url#" class="btn btn-primary">
												<i class="fas fa-play"></i> TRAILER
												</a></td>
										</tr>								
										<tr>							
											<th colspan="2">Theatre Name</th>
											<th>Shows</th>
											<th colspan="2">Show Date</th>
										</tr>
										<tr>
											<td colspan="2"> #theatre_name#</td>											
											<td>
												<!---<cfset showList="">
												<cfset show_names=application.show.showNameTheatre(cdate,th_id,m_id)>
												<cfloop array="#show_names#" index="i">
													<cfset showList=listAppend(showList, i.show_name)>
												</cfloop>
											#showList#--->
											#show_name#
											</td>
											<td colspan="2">#DateFormat(release_date,"mmmm dd, yyyy")# - #DateFormat(end_date,"mmmm dd, yyyy")#</td>
										</tr>
									</table>
								</td>
							</tr>						
						</cfoutput>
					</tbody>
				</table>
			<cfelse>
				<cfset date_string=toString(toBinary(cdate))>
				<cfset date_convert=parseDateTime(date_string)>
				<cfset cdate=dateFormat(date_convert,"yyyy-mm-dd")>
				<cfset other_dates=application.show.showDate(cdate)>				
				<table class="table table-striped now_table ">
					<tbody>
						<cfoutput query='other_dates'>
							<cfset movId=toBase64(m_id)> 
							<tr>
								<td><a href="movie-details.cfm?id=#movId#"><img src="uploads/#poster#" class="img-fluid img-now"></a></td>
								<td>
									<table class="table table-borderless">
										<tr>
											<th>Movie Name</th>
											<th>Genre</th>
											<th>Release Date</th>
											<th>Book Ticket</th>
											<th>Watch Trailer</th>
										</tr>								
										<tr>
											<td>#movie_name#</td>
											<td>#genre#</td>
											<td>#DateFormat(release_date,"mmmm dd, yyyy")#</td>
											<td><a href="book-ticket.cfm?id=#toBase64(id)#&mid=#toBase64(m_id)#&date=#toBase64(cdate)#" class="btn btn-showing">
												<i class="fa-solid fa-ticket"></i> Book Ticket
												</a>
											</td>
											<td><a href="#trailer_url#" class="btn btn-primary">
												<i class="fas fa-play"></i> TRAILER
												</a>
											</td>
										</tr>								
										<tr>								
											<th colspan="2">Theatre Name</th>
											<th>Shows</th>
											<th colspan="2">Show Date</th>
										</tr>
										<tr>
											<td colspan="2"> #theatre_name#</td>
											<!---<cfset show_names=application.show.showNameTheatre(cdate,th_id,m_id)>
											<td>
												<cfset showList="">
												<cfloop array="#show_names#" index="i">
													<cfset showList=listAppend(showList, i.show_name)>
												</cfloop>
												#showList#--->
											<td>#show_name#
											</td>
											<td colspan="2">#DateFormat(release_date,"mmmm dd, yyyy")# - #DateFormat(end_date,"mmmm dd, yyyy")#</td>
										</tr>
									</table>
								</td>
							</tr>						
						</cfoutput>
					</tbody>
				</table>
			</cfif>
    	</div>
	</div>	
</div>
<cfinclude  template="user_footer.cfm">

