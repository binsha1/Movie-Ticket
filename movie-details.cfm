<cfparam  name="id" default="val">
<cfinclude  template="user_header.cfm">
<cfset movId=toString(toBinary(id))>
<cfset mov_res=application.movie.movieCastCrew(movId)>
    <div class="pic-a-movie">
		<h3 class="text-white">Movie Details</h3>
	</div>
    <div class="container ">
        <cfoutput query='mov_res'>        
            <div class="row">
                <div class="col-md-4 ">
                    <img src="uploads/#poster#" alt="" class="img-fluid mov_image">
                </div>
                <div class="col-md-8">
                    <h1 class="text-white mov_title">#movie_name#</h1>
                    <div class="mov-2 pt-2">
                        <p><span class="mfor">#movie_format#</span> <span class="mfor">#language#</span></p>
                    </div>
                    <div class="mov-3 pt-3 text-white">                    
                        <p><span>#genre# .</span> 
                        <span> #dateFormat('#release_date#','dd-mm-yyyy')#</span> 
                        <span>. #duration#</span>
                        </p>
                        
                    </div>
                    
                </div>
            </div>      
        
        <div class="row pt-5 text-white">
            <h3>SYNOPSIS</div>            
            <p class="desc_text">#description#</p>
        </div>
        <div class="row pt-5 text-white">
            <h3>CAST</div>            
            <p class="desc_text">#description#</p>
        </div>
        <div class="row pt-5 text-white">
            <h3>CREW</div>            
            <p class="desc_text">#description#</p>
        </div>
        </cfoutput>
    </div>
    </div>	
	<!---<div class="now-showing-list">
		<div class="col-md-4 movies-by-category movie-booking">			
            <div class="movie-ticket-book">                
                <img src="assets/user_template/images/movie-show.jpg" alt="">
                <div class="bahubali-details">
                    <h4>Release Date:</h4>
                    <p>Jul 3, 2015</p>
                    <h4>Duration:</h4>
                    <p>2 hrs 26 mins</p>
                    <h4>Director:</h4>
                    <p>Vemuganti</p>
                    <h4>Language:</h4>
                    <p>Telugu</p>
                    <h4>Genre:</h4>
                    <p>Action, Romance</p>
                    <h4>Cast &amp; Crew:</h4>
                    <p>Manoj Nandam, Priyadarshini, Vikrant, Brahmanandam, Ali Basha</p>
                </div>	
            </div>
		</div>		
		<div class="clearfix"></div>
	</div>--->
		
		
<cfinclude  template="user_footer.cfm">

Status Update	            :  21-07-2022
Working on 	            :  Movie ticket
Task                             : Movie details template design| 
                                   Movie Detail Functionality                 
Task Completion        :  50%
ETA                             : 05-08-2022
Link                            : https://github.com/binsha1/Movie-Ticket.git