<cfinclude  template="user_header.cfm">

<cfset fromDate = Now()> 
<cfset toDate = Now() + 5> 

<!---
<div class="reviews-tabs">
      <!-- Main component for a primary marketing message or call to action -->
      <ul class="nav nav-tabs responsive hidden-xs hidden-sm" id="myTab">
        <li class="test-class active"><a class="deco-none misc-class" href="#how-to"> Synopsis</a></li>
        <li class="test-class"><a href="#features">Critic Reviews (1)</a></li>
        <li><a class="deco-none" href="#source">User Reviews (11)</a></li>
      </ul>

      <div class="tab-content responsive hidden-xs hidden-sm">
        <div class="tab-pane active" id="how-to">
		 <p><strong> Director :</strong> <a href="#">S.S. Rajamouli.</a></p>
          <p> <strong>Cast & Crew :</strong> <a href="#">Lorem ipsum</a> ,<a href="#">Lorem ipsum</a> ,<a href="#">Lorem ipsum</a>, <a href="#">Lorem ipsum</a>, <a href="#">Lorem ipsum</a>, <a href="#">Lorem ipsum</a></p>
		  <p>No content is available for this movie. Official sources can send relevant information to <br>
		  <a href="mail-to:mail@example.com">content@example.com</a></p>
          
     
        </div>
        <div class="tab-pane" id="features">
		  <p class="cr-left"><strong>123Telugu.com</strong></p><div class="rating-cr">
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
								</div> 
								<div class="clearfix"></div>
          <p>Continuing with the trend of crime comedies, yet another interesting flick titled Where is Vidya Balan has hit the screens today. Lets see how it is.</p>
        <a href="#">....Read full review</a>
		</div>
        <div class="tab-pane" id="source">
		  <div class="response">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 21, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="images/icon1.png" alt="">
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
        </div>
      </div>		
	</div>
	<!---> 
    <cfoutput>#dateformat(i, "ddd")#<br /></cfoutput> --->
	---->

<div class="container p-5">
	<!---<ul class="nav nav-pills">
		
		<cfloop from="#fromDate#" to="#toDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#"> 
		
		
			<li class="nav-item">
				<a class="nav-link date-nav"  href="#active">
					<cfoutput>#dateformat(i, "dd")#
					<p>#dateformat(i, "ddd")#</p>
					</cfoutput>
				</a>
			</li>
		
		</cfloop>
		
	</ul>
	<div class="tab-content" >
		<div class="tab-pane">
			<div class="row border g-0 rounded shadow-sm">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>hjjhg</td>
							<td>hjjhg</td>
							<td>hjjhg</td>
							<td>hjjhg</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>---->
	<ul class="nav nav-pills" role="tablist">
		<li class="nav-item">
		<a class="active nav-link " data-bs-toggle="pill" href="#home_pill">Home</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-bs-toggle="pill" href="#menu1">Menu 1</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-bs-toggle="pill" href="#menu2">Menu 2</a>
		</li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home_pill" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="container tab-pane "><br>
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="container tab-pane "><br>
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>

	
</div>


<cfinclude  template="user_footer.cfm">

Status Update	            :  22-07-2022
Working on 	            :  Movie ticket
Task                             :                  
Task Completion        :  52%
ETA                             : 05-08-2022
Link                            : https://github.com/binsha1/Movie-Ticket.git