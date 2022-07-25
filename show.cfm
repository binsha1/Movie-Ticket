<cfinclude  template="user_header.cfm">
<cfset today_date=DateFormat(Now(),"yyyy-mm-dd")>
<cfparam name="cdate" default="#today_date#">

<cfset fromDate = Now()> 
<cfset toDate = Now() + 5> 
<cfset today_movies=application.show.todayDetails()>

<div class="container p-5">
	<ul class="nav nav-pills justify-content-center" role="tablist" >
		<cfloop from="#fromDate#" to="#toDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#"> 
			<li class="nav-item">
			
			<cfoutput>
			<a class=" nav-link date-nav "  href="components/show.cfc?method=getMovieDate&date=#DateFormat(i,"yyyy-mm-dd")#">
 				#dateformat(i, "dd")#<br>
				#dateformat(i, "ddd")#
			</cfoutput></a>
			</li>
			<!---<li class="nav-item">
			<a class="nav-link" data-bs-toggle="pill" href="#menu1">Menu 1</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-bs-toggle="pill" href="#menu2">Menu 2</a>
			</li>---->
		</cfloop>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home_pill" class="container tab-pane active"><br>
	
	<cfif cdate EQ today_date>
      <table class="table table-striped now_table ">
	  				<tbody>
					<cfoutput query='today_movies'>
					<tr>
							<td><img src="uploads/#poster#" class="img-fluid img-now"></td>
							<td >
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
							        <td>#release_date#</td>
									<td></td>
									<td></td>
								</tr>
								
								<tr>
								
									<th colspan="2">Theatre Name</th>
									<th>Shows</th>
									<th colspan="2">Show Date</th>
								</tr>
								<tr>
									<td colspan="2"> #theatre_name#</td>
									<td> #screen_name#</td>
									<td colspan="2">#end_date#</td>
								</tr>
							</table>
							</td>
						</tr>
						
					</cfoutput>
						
					</tbody>
				</table>
		<cfelse>
				<cfset other_dates=application.show.showDate(cdate)>
					<table class="table table-striped now_table ">
	  				<tbody>
					<cfoutput query='other_dates'>
					<tr>
							<td><img src="uploads/#poster#" class="img-fluid img-now"></td>
							<td >
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
							        <td>#release_date#</td>
									<td></td>
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
									<td> #screen_name#</td>
									<td colspan="2">#end_date#</td>
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

