<cfinclude  template="user_header.cfm">
<cfparam  name="status" default="val">
<section class=" reg_bg bg-image">
  <div class="mask d-flex align-items-center ">
    <div class="container p-5">
      <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-show text-center ">WELCOME</h2>
                <h4 class="text-center mb-5">TO BOOKMYTICKET</h4>
                <cfif status EQ hash('2','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
                            Email Id Already Exists !!
                    </div>
                <cfelseif status EQ hash('3','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="reg close" data-dismiss="alert" aria-label="close">&times;</a>
                            Please Fill All fields !!
                    </div>
                </cfif>      
              <form action="components/controller.cfc?method=userSignUp" method="post">

                <div class="form-outline mb-4">
                 <label class="form-label" for="form3Example1cg"> Name</label>
                  <input type="text" id="form3Example1cg" name="full_name" class="form-control " placeholder="Name" required/>
                 
                </div>

                <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3cg">Email</label>
                  <input type="email" name="email" id="form3Example3cg" class="form-control"  placeholder="Email Id" required/>
                  
                </div>

                <div class="form-outline mb-4">
                <label class="form-label" for="form3Example4cg">Password</label>
                  <input type="password" id="form3Example4cg" class="form-control " name="pass" placeholder="Password" required/>
                  
                </div>
                <div class="d-flex justify-content-center">
                  <input type="submit" class="btn btn-showing" name="submit" value="Sign Up">
                </div>

                <p class="text-center text-white">Have already an account? <a href="login.cfm"
                    class="fw-bold  text-white"><u>Login here</u></a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<cfinclude  template="user_footer.cfm">

