<cfparam  name="status" default="val">
<cfinclude  template="../header.cfm">
    <div class="container-fluid">
        <div class="container py-5">                            
            <div class="row bg-form">              
                <div class="col-lg-12 ">                                           
                    <div class="col-lg-6 offset-lg-3 admin-div">                        
                        <h3 class="text-contact pt-5 text-center pb-3">Book My Ticket | Admin Login </h3>                            
                            <cfif status EQ hash('1','sha')>
                                <div class="alert alert-danger alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Invalid Credentials!!
                                </div>
                            </cfif>                      
                        <form method='post' name="img_form" action="../components/results.cfc?method=doLogin" class="pt-3">
                            <div class="form-group row">
                                <label class="form-label col-sm-3" >User Name: </label>
                                <div class='col-sm-9'>
                                    <input type="text" class="form-control" name="user_name" placeholder="Enter User Name" id="f_name" required="yes">
                                </div>
                            </div>
                            <div class="form-group row pt-3">
                                <label  class="form-label col-sm-3" >Password: </label>
                                <div class='col-sm-9'>
                                    <input type="password" class="form-control" name="pwd" placeholder="Enter Password"  required="yes">
                                </div>
                            </div>           
                            <div class='form-group row pt-3'>        
                                <div class='col-sm-12 text-center'>
                                    <input type="submit" name="Submit"  value="Login " class="btn btn-ticket" >
                                </div>
                            </div>
                        </form> 
                    </div>                      
                </div>
            </div>        
        </div>
    </div>
<cfinclude  template="../footer.cfm">