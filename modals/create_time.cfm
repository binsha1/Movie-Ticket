<!--Create Modal -->                        
<div class="modal timeModal" >
    <div class="modal-dialog modal-lg">
        <form method='post' action="" name="time_form" id="timeForm" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="time_title"> </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <!---<h3 class="text-left ">Add Theatre</h3>---->                    
                   <div class="form-group row">                        
                        <div class="col-lg-4">
                            <input type="hidden" name="theatre_id" value="" id="t_id">
                            <label class="form-label required control-label pt-3" >Show Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Screen Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Show Start Time:</label>
                        </div>                             
                        <div class="col-lg-4 ">
                            <!---<input type="text" name="screen_name" class="form-control" id="screen_name" placeholder="Screen Name" value="" required onchange="checkScreen()">---->
                            <select name="show_name" id="show_name" class="form-control" required>
                                <option  value="" >Select Show</option>
                                <option value="First Show">First Show</option>
                                <option value="Second Show">Second Show</option>
                                <option value="Matinee">Matinee</option>
                            </select>
                            <span class="screen_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">                            
                            <select name="screen_name" id="screen_name" class="form-control" required>
                                <option value="">Select Screen</option>
                                <cfoutput> 
                                <cfloop array="#screen_data#" index="i">                                   
                                    <option value="#i.id#">#i.screen_name#</option>  
                                </cfloop>                                  
                                </cfoutput>                                
                            </select>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="time" name="start_time" class="form-control"  id="start_time" required >                           
                        </div>                          
                    </div>                                                                                                            
                </div>                                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save" id="time_btn" onclick="validateCreate();">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 



