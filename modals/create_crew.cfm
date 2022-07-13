<!--Create Modal -->                        
<div class="modal crewModal" >
    <div class="modal-dialog modal-lg">
        <form method='post' action="../components/movie.cfc?method=createCrew" name="screen_form" id="crewForm" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="crew_title">ADD CREW</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <!---<h3 class="text-left ">Add Theatre</h3>----> 
                    <div class="row">
                        <div class="col-lg-8">                   
                            <div class="form-group row">                        
                                <div class="col-lg-6">
                                    <input type="hidden" name="movie_id" value="" id="mov_id">
                                    <label class="form-label required control-label pt-3" >Role Name:</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Persons Name:</label>
                                </div>
                                <div class="col-lg-6 ">
                                    <input type="text" name="role_name" class="form-control" id="role_name" placeholder="Role Name" value="" required >
                                </div>
                                <div class="col-lg-6 ">
                                    <input type="text" name="person_name" class="form-control" id="person_name" placeholder="Persons Name" value="" required >                            
                                   
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label class="form-label required control-label pt-3" >Photo:</label>
                                </div>                             
                                
                                <div class="col-lg-12 ">
                                    <input type="file" name="crew_photo" class="form-control"  id="crew_photo" required onchange="loadCrew(event)" >                            
                                    <span class="crew_alert text-danger pt-3"></span> 
                                </div>                          
                            </div>
                        </div>                    
                        <div class="col-lg-4">
                            <div class="img-show">
                                <img id="crew_output" class="img-fluid "/>
                            </div>
                        </div>
                    </div>
                </div>                                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save" id="crew_btn" onclick="validateCreate();">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 

<!---Screen Modal---->
<!--- Time Modal--->


<!--- Time Modal--->