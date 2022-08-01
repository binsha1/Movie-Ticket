
<cfinclude  template="user_header.cfm">
<cfparam  name="seat_num" default="0">
<cfparam  name="show_id" default="0">
<cfparam  name="date" default="#dateFormat(now(),'yyyy-mm-dd')#">
<cfset pdate=toString(toBinary(date))>
<cfset showId=toString(toBinary(show_id))>
<cfset seat_s=toString(toBinary(seat_num))>
<cfset show_res=application.show.getShowDetails(showId)>
<cfoutput >
        <cfloop array="#show_res#" index="i">
            <div class="order-container">
                <div class="order pt-3">
                
                    <img class="order__images" alt='' src="uploads/#i.poster#">
                    <p class="order__title text-center text-white">#i.movie_name# <br>
                    <span class="order__descript">#i.theatre_name#| #i.language# -#i.movie_format#</span></p>
                     
                </div>
            </div>

            <div class="dt_div mt-5">
                <div class="container p-4">
                    <a href="book-ticket.cfm?id=#show_id#&mid=#toBase64(i.m_id)#&date=#date#" class="btn btn-showing" >Back</a>
                    <div class="show_right">
                        <button class="btn btn-showing">#dateformat(pdate,"full")#</button>
                        <button class="btn btn-showing">#timeFormat(i.start_time)# (#i.show_name#)</button>
                   
                </div>
            </div>
            </div>
                <div class="order-step-area pt-3 text-center">
                   <!---- <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>--->
                    <div class="order-step second--step text-white text-center">Please Choose <cfoutput>#seat_s#
                    </cfoutput> seat Now</div>
                </div>
            
            
                </cfloop>
                </cfoutput>
                <div class="movie-container">
        <label>Pick a movie:</label>
        <select id="movie">
            <option value="650">Parasite (₹650)</option>
            <option value="850">Joker (₹850)</option>
            <option value="550">Jumanji: Next Level (₹550)</option>
            <option value="750">Dolittle (₹750)</option>
        </select>
    </div>

    <ul class="showcase">
        <li>
            <div class="seat"></div>
            <small>N/A</small>
        </li>
        <li>
            <div class="seat selected"></div>
            <small>Selected</small>
        </li>
        <li>
            <div class="seat occupied"></div>
            <small>Occupied</small>
        </li>
    </ul>

    <div class="container">
        <div class="movie-screen">
            <img src='assets/user_template/seat/images/screen-thumb.png' alt='screen' />
        </div>

        <div class="row-container">
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
            </div>
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat occupied"></div>
                <div class="seat occupied"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
            </div>
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat occupied"></div>
                <div class="seat occupied"></div>
            </div>
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
            </div>
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat occupied"></div>
                <div class="seat occupied"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
            </div>
            <h5 class='subtitle'>GOLD - ₹650</h5>
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
            </div>
            <div class="row">
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat"></div>
                <div class="seat occupied"></div>
                <div class="seat occupied"></div>
                <div class="seat occupied"></div>
                <div class="seat"></div>
            </div>
            <h5 class='subtitle'>DIAMOND - ₹850</h5>

            <div class="text-wrapper">
                <p class="text">Selected Seats <span id='count'>0</span>
                    <p class="text">Total Price ₹<span id="total">0</span></p>
            </div>
        </div>

    </div>


    <!-- <div class="text-wrapper">
        <p class="text">Selected Seats <span id='count'>0</span>
            <p class="text">Total Price ₹<span id="total">0</span></p>
    </div> -->

<cfinclude  template="user_footer.cfm">