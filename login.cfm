<cfinclude  template="user_header.cfm">
<cfparam  name="status" default="val">
<section class=" reg_bg bg-image">  
	<div class="mask d-flex align-items-center ">
		<div class="container p-5">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body p-5">
							<h2 class="text-uppercase text-center mb-5">Login </h2>
							<cfif status EQ hash('1','sha')>
								<div class="alert alert-danger alert-dismissible">
									<a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
										Invalid Credentials!!
								</div>
							<cfelseif status EQ hash('2','sha')>
								<div class="alert alert-success alert-dismissible">
									<a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
										Registered SuccessFully !!
								</div>
							<cfelseif status EQ hash('4','sha')>
								<div class="alert alert-success alert-dismissible">
									<a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
										Password Changed Successfully !!
								</div>
							</cfif>
							<form action="components/controller.cfc?method=userLogin" method="post">
								<div class="form-outline mb-4">
									<input type="hidden" name="login_value" value="0">
									<input type="hidden" name="movie_id" value="0">
									<input type="hidden" name="show_id" value="0">
									<input type="hidden" name="cdate" value="0">
									<label class="form-label" for="form3Example3cg">Email</label>
									<input type="email" name="email" id="form3Example3cg" class="form-control"  placeholder="Email Id" required/>
								</div>
								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example4cg">Password</label>
									<input type="password"  name="pass" id="form3Example4cg" class="form-control " placeholder="Password" required/>
								</div>
								<div class="d-flex ">
									<input type="submit" class="btn btn-showing" name="submit" value="Login"> <a class="btn btn-show" href="forgot_password.cfm">Forgot Your Password?</a>
								</div>
								<p class="text-center text-white pt-3">Don't have an account? 
									<a href="signup.cfm" class="fw-bold  text-white"><u>Sign up</u></a></p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<cfinclude  template="user_footer.cfm">

