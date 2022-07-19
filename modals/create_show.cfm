<!--Create Modal -->                        
<div class="modal showModal" >
    <div class="modal-dialog modal-lg">
        <form method='post' action="" name="img_form" id="showId" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="show_title"> </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <!---<h3 class="text-left ">Add Theatre</h3>---->
                    <div class="form-group row">                        
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Movie </label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Theatre </label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Screen:</label>
                        </div>                             
                        <div class="col-lg-4 ">
                            <select name="movie" id="movie" class="form-control" required>
                                <option value="">Select Movie</option>
                                <cfoutput query='movie_res'>                                    
                                    <option value="#id#">#movie_name#</option>                                    
                                </cfoutput>                                
                            </select>
                        </div>
                        <div class="col-lg-4 ">
                            <select name="theatre" id="theatre" class="form-control" required onchange="screenList()">
                                <option value="">Select Theatre</option>
                                <cfoutput query='theatre_res'>                                    
                                    <option value="#id#">#theatre_name#</option>                                    
                                </cfoutput>                                
                            </select>
                        </div>
                        <div class="col-lg-4 ">                            
                            <select name="screen" id="screen" class="form-control" required onchange="timeList()">
                                <option value="">Select Screen</option>
                            </select>
                        </div>                          
                    </div>
                    <div class="form-group row">                        
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Show Time</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Planned End Date </label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Show Priority</label>
                        </div>                            
                        <div class="col-lg-4 ">
                            <select name="screen_time" id="screen_time" class="form-control" required >
                                <option value="">Select Show Time</option>
                            </select>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="date" name="end_date" class="form-control" id="end_date"  required>
                        </div>
                        <div class="col-lg-4 ">
                            <select name="show_priority" id="priority" class="form-control" required>
                                <option value="">Select Show Priority</option>                                                                    
                                    <option value="Top">Top</option> 
                                    <option value="Medium">Medium</option>  
                                    <option value="Bottom">Bottom</option>                                    
                            </select>
                        </div>                          
                    </div>
                    <div class="form-group row">
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3">Total Seats</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3">Show Status</label>
                        </div>
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">                            
                            <input type="text" name="total_seats" class="form-control" placeholder="Total Seats" id="total_seats" required >
                            <span class="text-danger error_alert"></span>
                        </div>
                        <div class="col-lg-4">
                            <select name="show_status" id="show_status" class="form-control" required>
                                <option value="">Select Show Status</option>                                                                    
                                <option value="Active">Active</option> 
                                <option value="Pending">Pending</option>  
                                <option value="Inactive">Inactive</option>                                    
                            </select>
                        </div><div class="col-lg-4"></div>                                                    
                    </div>                  
                </div>                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save" id="show_btn" onclick="validateShow();">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 