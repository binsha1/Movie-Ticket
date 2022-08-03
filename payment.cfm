<cfinclude  template="user_header.cfm">
<cfparam  name="seat_num" default="0">
<cfparam  name="show_id" default="0">
<cfparam  name="ts" default="0">
<cfparam  name="tprice" default="0">
<cfparam  name="date" default="#dateFormat(now(),'yyyy-mm-dd')#">
<cfset pdate=toString(toBinary(date))>
<cfset showId=toString(toBinary(show_id))>
<cfset seat_s=toString(toBinary(seat_num))>
<cfset seat_split =seat_s.Split(",")>
<cfset time_id=toString(toBinary(ts))>
<cfset total_price=toString(toBinary(tprice))>
<cfset show_res=application.show.getShowDetails(showId)>
<cfset time_res=application.theatre.getScreenTime(time_id)>
<div class="container p-5">
    <div class="row">
        <div class="col-md-4">
            <div class="payment-right">
                <cfoutput>
                <cfloop array="#show_res#" index="i">                
                <h3>Booking Summary</h3>
                <h6><span>Movie:</span>#i.movie_name#</h6>
                <p><span>Theatre:</span> #i.theatre_name# </p>
                </cfloop>
                
                <p><span>Date:</span> #dateformat(pdate,"full")#</p>
                <cfloop array="#time_res#" index="j">
                    <p><span>Time:</span> #timeformat(j.start_time)# (#j.show_name#)</p>
                    <p><span>Tickets:</span>#ArrayLen(seat_split)#</p>
                    <p><span>Seats:</span>  #seat_s#</p>
                    <h4><span>Price :</span>Rs.#total_price#</h4>
                    <h5>Grand Total :Rs. #total_price#</h5>
                </cfloop>
                </cfoutput>
            </div>
		</div>

        <div class="col-md-8">
            <div class="payment-right">
                
                <cfoutput>
                <div class="form-outline mb-4">
                 <label class="form-label" for="form3Example1cg"> Name</label>
                  <input type="text" id="name_p" name="full_name" class="form-control " placeholder="Name" value="#session.userLog.user_name#" required/>
                 
                </div>

                <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3cg">Email</label>
                  <input type="email" name="email" id="email_p" class="form-control"  placeholder="Email Id" value="#session.userLog.email_id#" required/>
                  
                </div>

                <div class="form-outline mb-4 col-lg-5">
                <label class="form-label" for="form3Example4cg">Total Amount</label>
                
                  <input type="text" name="total_amount" id="amount" class="form-control"  placeholder="Total Amount" value="#total_price#" disabled />
                </cfoutput> 
                </div>
                <div class="form-group row">
                    <div class="">
                         <input type="checkbox" name="remember"> I agree to the terms and conditions
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                 <!--- <input type="submit" class="btn btn-showing" name="submit" value="Payment">--->
                 <button id="rzp-button1" onclick="payNow()">Pay</button>
                </div>
            
            </div>
		</div>
    </div>
</div>
			
			<div class="clearfix"></div>
		</div>
		</div>

    
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>

</script>

<cfinclude  template="user_footer.cfm">