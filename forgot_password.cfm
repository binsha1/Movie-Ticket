<cfinclude  template="user_header.cfm">
<cfparam  name="status" default="val">
<section class=" reg_bg bg-image">
	<div class="mask d-flex align-items-center ">
		<div class="container p-5">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body p-5">
							<h2 class="text-uppercase text-show text-center ">HELLO</h2>
							<h4 class="text-center mb-5">Forgot Password?</h4>
							<cfif status EQ hash('2','sha')>
									<div class="alert alert-danger alert-dismissible">
											<a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
													Please Fill all fields!
									</div>
							<cfelseif status EQ hash('3','sha')>
									<div class="alert alert-danger alert-dismissible">
											<a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
													Password and Confirm password should be same!!
									</div>
							<cfelseif status EQ hash('1','sha')>
									<div class="alert alert-danger alert-dismissible">
											<a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
													Email doesn't exists !!
									</div>
							</cfif>      
							<form action="components/controller.cfc?method=updateUserPassword" method="post">
								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example1cg">Email Id </label>
									<cfoutput>
										<input type="email" id="form3Example1cg" name="email_id" class="form-control " value="" placeholder="Name" required/>
									</cfoutput>
								</div>
								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example3cg">Enter New Password</label>
									<input type="password" name="pass" id="form3Example3cg" class="form-control"  placeholder="New Password" required/>
								 </div>
								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example4cg">Confirm Password</label>
									<input type="password" id="form3Example4cg" class="form-control " name="cpass" placeholder="Confirm Password" required/>
								</div>
								<div class="d-flex justify-content-center">
									<input type="submit" class="btn btn-showing" name="submit" value="Reset Password">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<cfinclude  template="user_footer.cfm">