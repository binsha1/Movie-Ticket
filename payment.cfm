<cfinclude  template="user_header.cfm">
<cfparam  name="reserve_id" default="0">
<cfset id=toString(toBinary(reserve_id))>
<cfset reserve_res=application.obj.getReservation(id)>
<cfoutput query="reserve_res">
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
				<div class="payment-right">
					<!---<cfloop array="#show_res#" index="i"> --->               
					<h3>Booking Summary</h3>
					<h6><span>Movie:</span>#movie_name#</h6>
					<p><span>Theatre:</span> #theatre_name# </p>
					<p><span>Date:</span> #dateformat(select_date,"full")#</p>
					<!---<cfloop array="#time_res#" index="j">--->
					<p><span>Time:</span> #timeformat(start_time)# (#show_name#)</p>
					<p><span>Tickets:</span>#seat_num#</p>
					<p><span>Seats:</span>  #seats#</p>
					<h4><span>Price :</span>Rs.#price#</h4>
					<h5>Grand Total :Rs. #price#</h5>
				</div>
			</div>
			<div class="col-md-8">
				<div class="payment-right">
					<div class="form-outline mb-4">
						<input type="hidden" name="reserve_id" value="#id#" id="reserve_id">
						<label class="form-label" for="form3Example1cg"> Name</label>
						<input type="text" id="name_p" name="full_name" class="form-control " placeholder="Name" value="#session.userLog.user_name#" required/>
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="form3Example3cg">Email</label>
						<input type="email" name="email" id="email_p" class="form-control"  placeholder="Email Id" value="#session.userLog.email_id#" required/>
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="phone_num">Phone Number</label>
						<input type="text" name="phone_num" id="phone_num" class="form-control"  placeholder="Phone Number" value="" required/>
					</div>
					<div class="form-outline mb-4 col-lg-5">
						<label class="form-label" for="form3Example4cg">Total Amount</label>
						<input type="text" name="total_amount" id="amount" class="form-control"  placeholder="Total Amount" value="#price#" disabled />
					</div>
					<div class="form-group row">
						<div class="">
							<input type="checkbox" name="remember"> I agree to the terms and conditions
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<!--- <input type="submit" class="btn btn-showing" name="submit" value="Payment">--->
						<button id="rzp-button1" class="btn btn-showing" onclick="payNow()">Pay</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</cfoutput>		
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<cfinclude  template="user_footer.cfm">