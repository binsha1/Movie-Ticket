<div id="ModalExample" class="modal fade loginModal">
    <cfif structKeyExists(session,"userLog")>
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-white">Seat Form</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class='text-center'>
                   
                    <h4>Welcome Plan Your Seating</h4>
                </div>
                <div class="container pt-5">
                <form role="form" method="POST" action="components/show.cfc?method=seatSelect">
                    
                    <div class="form-group">
                        <label class="control-label">Enter Numer of seats required -- <span class="seat_label text-success">(
                       
                        <cfoutput>
                         <input type="hidden" name="show_id" value="#showId#">
                        <cfloop array='#show_details#' index="i">
                            
                            <input type="hidden" name="total_seats" value="#i.total_seats#">
                             #i.total_seats#
                          
                        </cfloop>) Left</span>
                        </cfoutput>  
                        </label>
                        <div>
                            <input type="text" class="form-control input-lg" name="seats" value="">
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div>
                            
                            <button type="submit" class="btn btn-showing ">Seats Plan</button>
                            
                        </div>
                    </div>
                </form>
                </div>
            </div>
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
    <cfelse>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-white">Login Form</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class='text-center'>
                    <h4>HELLO</h4>
                    <h4>Kindly Login to Book Your Ticket</h4>
                </div>
                <div class="container pt-5">
                <form role="form" method="POST" action="components/controller.cfc?method=userLogin">
                    <input type="hidden" name="login_value" value="1">
                    <cfoutput >
                        <input type="hidden" name="movie_id" value="#movId#">
                        <input type="hidden" name="show_id" value="#showId#">
                        <input type="hidden" name="cdate" value="#pdate#">
                    </cfoutput>
                    
                    <div class="form-group">
                        <label class="control-label">E-Mail Address</label>
                        <div>
                            <input type="email" class="form-control input-lg" name="email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Password</label>
                        <div>
                            <input type="password" class="form-control input-lg" name="pass" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="remember"> Remember Me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            
                            <button type="submit" class="btn btn-showing ">Login</button>
                            <a class="btn btn-link" href="">Forgot Your Password?</a>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <div class="modal-footer text-xs-center">
                Don't have an account? <a href="signup.cfm">Sign up </a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
    
    
    </cfif>
</div><!-- /.modal -->
